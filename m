Return-Path: <linux-leds+bounces-5611-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE0BA77A7
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 22:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D107C4E05FA
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 20:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CE625FA29;
	Sun, 28 Sep 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abj/t+cM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB121DB125;
	Sun, 28 Sep 2025 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759092167; cv=none; b=gsRTF1A12eO9hmoIaZHw4k+MwjG826IVo518Q8uvKTuhSsVFZRxO3l4QtaJGycchLy9Bw9wpDZuwBPD+j4JXaPbdzJlPkBwbvHTfF3ZmxgKBRP3ThPwYXclgr2pndEO/9hma1JIL1RMpQRebtzvo70rdYfwYvZg91mJONFN3hN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759092167; c=relaxed/simple;
	bh=1sps20PL6Y5yiXBdDDnh6VsVaOkZk+a7m0mccmk7TBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob93Z/tcfuRTeK7DB18qJYRhR71bdY5ihRKEYCWgVPKzTsAzoNVIAT39TCh9OTVj8aRG78ACV+F+M8C326p93v96LA7aYN8uaJjnfdlL1C4OsTUdtQ7KEKyjTbFudHeqwPZRwILqBHAxxSqg7YVzQfWAPwGwPVw1+rjq27GFyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abj/t+cM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759092164; x=1790628164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1sps20PL6Y5yiXBdDDnh6VsVaOkZk+a7m0mccmk7TBk=;
  b=abj/t+cM+Z8fNqGFPUVLlYmyXcIEGLuVU3A81TVS9FkTfwHdtVHCbp7g
   1aOVMOAMMkyk7q450fZBPgafoW2RG6KWx35z4EwN+fO/JWwBTCXlMbruT
   VHa0zPR8DDIHL+sIRU/GIohuU5C2gutIq6JgwslqN886BbbPEf3qruXtL
   UnV6swUOShehFXivMZen/qlaOR/lDf1dxJS2/rcbXdHNtCfBIfLDTZxbP
   qapbRC1kI7wfCpX5T+T5j5lrfLBO/Eb9MpyiZd48deZB33X+Vw2ygRCbM
   /wIyo/wX62nxVRdFvrtf8ZnBOeXZk3YDEtGv1evJS9l/cgSfJwsbpMhnf
   A==;
X-CSE-ConnectionGUID: yTPN5fCWRpaA3K3tcA9r0A==
X-CSE-MsgGUID: QYB/Kl3CR/COu3Az4RSSzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="60375459"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="60375459"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 13:42:43 -0700
X-CSE-ConnectionGUID: 17ksutRlRWiQdhTcqFbgFw==
X-CSE-MsgGUID: TWYv+Q42TPGRcuEFSkLnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="177890257"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Sep 2025 13:42:39 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2yE8-0007z9-3D;
	Sun, 28 Sep 2025 20:42:36 +0000
Date: Mon, 29 Sep 2025 04:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
	alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
	lee@kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
Message-ID: <202509290415.uez00SgW-lkp@intel.com>
References: <20250928013253.10869-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928013253.10869-2-W_Armin@gmx.de>

Hi Armin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-x86-Add-Uniwill-laptop-driver/20250928-093543
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20250928013253.10869-2-W_Armin%40gmx.de
patch subject: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250929/202509290415.uez00SgW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509290415.uez00SgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509290415.uez00SgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1243 |                 guard(mutex)(&data->battery_lock);
         |                 ^
   include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:49:1: note: expanded from here
      49 | class_mutex_t
         | ^
   drivers/platform/x86/uniwill/uniwill-acpi.c:1250:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1250 |                 guard(mutex)(&data->input_lock);
         |                 ^
   include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:60:1: note: expanded from here
      60 | class_mutex_t
         | ^
   drivers/platform/x86/uniwill/uniwill-acpi.c:1249:2: error: cannot jump from switch statement to this case label
    1249 |         default:
         |         ^
   drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1243 |                 guard(mutex)(&data->battery_lock);
         |                 ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:47:1: note: expanded from here
      47 | __UNIQUE_ID_guard1072
         | ^
   2 warnings and 1 error generated.


vim +1243 drivers/platform/x86/uniwill/uniwill-acpi.c

  1235	
  1236	static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
  1237	{
  1238		struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
  1239		struct uniwill_battery_entry *entry;
  1240	
  1241		switch (action) {
  1242		case UNIWILL_OSD_BATTERY_ALERT:
> 1243			guard(mutex)(&data->battery_lock);
  1244			list_for_each_entry(entry, &data->batteries, head) {
  1245				power_supply_changed(entry->battery);
  1246			}
  1247	
  1248			return NOTIFY_OK;
  1249		default:
  1250			guard(mutex)(&data->input_lock);
  1251			sparse_keymap_report_event(data->input_device, action, 1, true);
  1252	
  1253			return NOTIFY_OK;
  1254		}
  1255	}
  1256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

