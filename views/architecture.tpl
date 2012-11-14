% if detail == 'list':
  % if architecture:
    <a class="architecture" href="/{{architecture.tree.state.identifier}}/architectures#{{path}}">
      {{!'<span class="error">☐</span>' if not architecture.components else '☑'}} {{architecture.title}} <span>{{path}}</span></a>
  % else:
    % include pathnotfound path=path, detail=detail
  % end
% elif detail == 'full':
  % if architecture:
    <dt><h2 id="{{path}}">{{!'<span class="error">☐</span>' if not architecture.components else '☑'}} {{architecture.title}} <span>{{path}}</span></h2></dt>
    <dd>
      <table cellspacing="0" cellpadding="0">
        <tr>
          <th>Description</th>
          <td class="description">{{!architecture.description}}</td>
        </tr>
        % if architecture.tags:
          <tr>
            <th>Tags</th>
            <td>
              <ul>
                % for path, tag in architecture.tags.iteritems():
                  <li>
                    % include tag path=path, tag=tag, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
        % if not architecture.toplevel:
          <tr>
            <th>Parent</th>
            <td>
              <p>
                % path, component = architecture.parent
                % if path:
                  % include component path=path, component=component, detail='list'
                % else:
                  <span class="error">No parent specified</span>
                % end
              </p>
            </td>
          </tr>
        % end
        <tr>
          <th>Components</th>
          <td>
            % if architecture.components:
              <ul>
                % for path, component in architecture.components.iteritems():
                  <li>
                    % include component path=path, component=component, detail='list'
                  </li>
                % end
              </ul>
            % else:
              <p class="error">No components specified yet.</p>
            % end
          </td>
        </tr>
        <tr>
          <th>Integration</th>
          <td>
            % path, strategy = architecture.integration_strategy
            % if path:
              % include integration-strategy path=path, strategy=strategy, detail='list'
            % else:
              <span class="warning">No integration strategy specified</span>
            % end
          </td>
        </tr>
        <tr>
          <th>Requirements</th>
          <td>
            % inherited_reqs = architecture.inherited_requirements(sort_by='title')
            % if inherited_reqs:
              <div class="expandable collapsed">
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
            % if architecture.mapped_here:
              <div class="expandable">
                <h3>Requirements Mapped Here</h3>
                <ul>
                  % for path, requirement in architecture.mapped_here.iteritems():
                    <li>
                      % include requirement path=path, requirement=requirement, detail='list'
                    </li>
                  % end
                </ul>
              </div>
            % end
            % delegated_reqs = architecture.delegated_requirements(sort_by='title')
            % if delegated_reqs:
              <div class="expandable collapsed">
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
        % if architecture.work_items:
          <tr>
            <th>Work Items</th>
            <td>
              <ul>
                % for path, item in architecture.work_items.iteritems():
                  <li>
                    % include workitem path=path, item=item, detail='list'
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
