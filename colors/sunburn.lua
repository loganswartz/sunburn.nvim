-- Clear the cache
package.loaded['sunburn'] = nil
package.loaded['sunburn.palette'] = nil
package.loaded['sunburn.highlights'] = nil
package.loaded['sunburn.utils'] = nil

-- load our theme and apply it
require('sunburn'):apply()
