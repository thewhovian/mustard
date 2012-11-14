% if detail == 'list':
  % if interface:
    <a class="interface" href="/{{interface.tree.state.identifier}}/interfaces#{{path}}">{{interface.title}} <span>{{path}}</span></a>
  % else:
    % include pathnotfound path=path, detail=detail
  % end
% elif detail == 'full':
  % if interface:
    <dt><h2 id="{{path}}">{{interface.title}} <span>{{path}}</span></h2></dt>
    <dd>
      <table cellspacing="0" cellpadding="0">
        <tr>
          <th>Description</th>
          <td>{{!interface.description}}</td>
        </tr>
        % if interface.tags:
          <tr>
            <th>Tags</th>
            <td>
              <ul>
                % for path, tag in interface.tags.iteritems():
                  <li>
                    % include tag path=path, tag=tag, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
        <tr>
          <th>Parent</th>
          <td>
            <p>
              % path, component = interface.parent
              % if path:
                % include component path=path, component=component, detail='list'
              % else:
                <span class="error">No parent specified</span>
              % end
            </p>
          </td>
        </tr>
        <tr>
          <th>Requirements</th>
          <td>
            % inherited_reqs = interface.inherited_requirements(sort_by='title')
            % if inherited_reqs:
              <div class="expandable secondary">
                <h3>Inherited Requirements</h3>
                <ul>
                  % for path, requirement in inherited_reqs:
                    <li>
                      % include requirement path=path, requirement=requirement, detail='list'
                    </li>
                  % end
                </ul>
              </div>
            % end
            % if interface.mapped_here:
              <div class="expandable expanded">
                <h3>Requirements</h3>
                <ul>
                  % for path, requirement in interface.mapped_here.iteritems():
                    <li>
                      % include requirement path=path, requirement=requirement, detail='list'
                    </li>
                  % end
                </ul>
              </div>
            % end
            % delegated_reqs = interface.delegated_requirements(sort_by='title')
            % if delegated_reqs:
              <div class="expandable secondary">
                <h3>Delegated Requirements</h3>
                <ul>
                  % for path, requirement in delegated_reqs:
                    <li>
                      % include requirement path=path, requirement=requirement, detail='list'
                    </li>
                  % end
                </ul>
              </div>
            % end
          </td>
        </tr>
        % if interface.work_items:
          <tr>
            <th>Work Items</th>
            <td>
              <ul>
                % for path, item in interface.work_items.iteritems():
                  <li>
                    % include workitem path=path, item=item, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
        % if interface.tests:
          <tr>
            <th>Tests</th>
            <td>
              <ul>
                % for path, test in interface.tests.iteritems():
                  <li>
                    % include test path=path, test=test, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
      </table>
    </dd>
  % else:
    % include pathnotfound path=path, detail=detail
  % end
% end
