% if detail == 'list':
  <a href="/architectures#{{path}}">{{path}} <span>{{architecture.title}}</span></a>
% elif detail == 'full':
  <dt><h2 id="{{path}}">{{path}} <span>{{architecture.title}}</span></h2></dt>
  <dd>
    <table cellspacing="0" cellpadding="0">
      <tr>
        <th>Description</th>
        <td>{{!architecture.description}}</td>
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
      % if architecture.for_component:
        % path, component = architecture.for_component
        <tr>
          <th>Parent Component</th>
          <td>
            <p>
              % include component path=path, component=component, detail='list'
            </p>
          </td>
        </tr>
      % end
      % if architecture.components:
        <tr>
          <th>Components</th>
          <td>
            <ul>
              % for path, component in architecture.components.iteritems():
                <li>
                  % include component path=path, component=component, detail='list'
                </li>
              % end
            </ul>
          </td>
        </tr>
      % end
      % if architecture.covers:
        <tr>
          <th>Requirements Covered</th>
          <td>
            <ul>
              % for path, requirement in architecture.covers.iteritems():
                <li>
                  % include requirement path=path, requirement=requirement, detail='list'
                </li>
              % end
            </ul>
          </td>
        </tr>
      % end
    </table>
  </dd>
% end
