Return-Path: <linux-leds+bounces-5525-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C59B80113
	for <lists+linux-leds@lfdr.de>; Wed, 17 Sep 2025 16:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FC077B6081
	for <lists+linux-leds@lfdr.de>; Wed, 17 Sep 2025 03:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C57D288504;
	Wed, 17 Sep 2025 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiFT5vEg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE01D5147;
	Wed, 17 Sep 2025 03:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758080263; cv=none; b=o+74dBeDNYXL0ID+wkaHxQp3OAfsynEhcCamzf9pZaOJ972OtLmoUy4Z19uLMhsDJMVsQ5qnfb24tu5DkcgaXHc4DDaGpjvOxSc26U81gHxPb6FC/fdin8gRLGxTBpium3YWaDP5yfNggSBTGnel/J2w71iA8XkN2E+bhT9mjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758080263; c=relaxed/simple;
	bh=QpIzzmoiyjFzmUV5nFkRfpf05E6kPAgObYxnWHjp9K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfdv8AB5J24VzG0J2nSVklEsK27Vf2Te1yqp4RsEOKHz01jVSByCbfS8Q75D2/7kJkv7LtFNMfNPjyiMKnXSR+Qquy2J9hC+rQ2Jo3C7hbvCzpt2+cLk3BANHpGRDaFlO+WYH92BXvBGCYdrAXq2ayjg8AzorHpdk4MYAWxBD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiFT5vEg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758080260; x=1789616260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpIzzmoiyjFzmUV5nFkRfpf05E6kPAgObYxnWHjp9K8=;
  b=DiFT5vEgApYtQFX0fEn7rMX7q84S1GdMb+RNiPkhPwj2To1ja1SAf4FK
   9Nn8G+nqus5g1+ag1KX0FPjnR9RWcfBLJRMhsjkgmkmv/24h//H/NMFal
   kywUh63gaPL8WBNDZ0Fm9SA068+0Ns6XR52AwzoxF7FO5jT9ih12UuBif
   nLxTHUQVUmOce4LxTsFmIK0SFneZFGt7n73prsMVW9rneXTTn4cgU6qDd
   5Odjj2E7VcjaTNMkpNcgScy6fimNXJ7+KL7n+WIEFRK0FCC1nBZgPhxYF
   sKRpSPNg4sl+x84FbCu4zkChyZaqIFSHhUUkHr/7VNm7ZQ4riszGWt/mW
   A==;
X-CSE-ConnectionGUID: qg+s1tG/S/yyacGIqdZcrQ==
X-CSE-MsgGUID: h0KfdJuGTcO14Fx8XEg6Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71741189"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="71741189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 20:37:39 -0700
X-CSE-ConnectionGUID: ut4duC27SRigilgrF4A0MQ==
X-CSE-MsgGUID: BIvNzQaMR3i/HH9X1fbcUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175214302"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Sep 2025 20:37:35 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyiz7-00011H-0y;
	Wed, 17 Sep 2025 03:37:33 +0000
Date: Wed, 17 Sep 2025 11:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/5] leds: rgb: Add Virtual Color LED Group driver to Make
Message-ID: <202509171109.7rJrwT7i-lkp@intel.com>
References: <20250916110217.45894-2-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916110217.45894-2-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/leds-rgb-Add-Virtual-Color-LED-Group-driver-to-Make/20250916-190606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250916110217.45894-2-professorjonny98%40gmail.com
patch subject: [PATCH 2/5] leds: rgb: Add Virtual Color LED Group driver to Make
config: i386-randconfig-012-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171109.7rJrwT7i-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171109.7rJrwT7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171109.7rJrwT7i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/rgb/leds-group-virtualcolor.c: In function 'leds_virtualcolor_init_vled':
   drivers/leds/rgb/leds-group-virtualcolor.c:254:28: error: implicit declaration of function 'of_led_get'; did you mean 'of_node_get'? [-Werror=implicit-function-declaration]
     254 |                 led_cdev = of_led_get(child, i);
         |                            ^~~~~~~~~~
         |                            of_node_get
>> drivers/leds/rgb/leds-group-virtualcolor.c:254:26: warning: assignment to 'struct led_classdev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     254 |                 led_cdev = of_led_get(child, i);
         |                          ^
   cc1: some warnings being treated as errors


vim +254 drivers/leds/rgb/leds-group-virtualcolor.c

8ce5fa26ed391cb Jonathan Brophy 2025-09-16  217  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  218  static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  219  				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  220  {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  221  	struct fwnode_handle *child_fwnode = of_fwnode_handle(child);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  222  	struct led_init_data init_data = {};
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  223  	u32 blink_interval;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  224  	u32 phandle_count;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  225  	u32 max_brightness;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  226  	int ret, i;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  227  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  228  	ret = of_property_read_u32(child, "priority", &vled->priority);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  229  	if (ret)
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  230  		vled->priority = 0;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  231  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  232  	ret = of_property_read_u32(child, "blink", &blink_interval);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  233  	if (!ret) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  234  		vled->blink_delay_on = blink_interval;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  235  		vled->blink_delay_off = blink_interval;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  236  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  237  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  238  	phandle_count = fwnode_property_count_u32(child_fwnode, "leds");
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  239  	if (phandle_count <= 0) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  240  		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  241  			vled->cdev.name);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  242  		return -EINVAL;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  243  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  244  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  245  	vled->num_monochromatics = phandle_count;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  246  	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  247  					    sizeof(*vled->monochromatics), GFP_KERNEL);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  248  	if (!vled->monochromatics)
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  249  		return -ENOMEM;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  250  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  251  	for (i = 0; i < vled->num_monochromatics; i++) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  252  		struct led_classdev *led_cdev;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  253  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16 @254  		led_cdev = of_led_get(child, i);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  255  		if (IS_ERR_OR_NULL(led_cdev)) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  256  			/*
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  257  			 * If the LED is not available yet, defer the probe.
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  258  			 * The probe will be retried when the it becomes available.
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  259  			 */
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  260  			if (PTR_ERR(led_cdev) == -EPROBE_DEFER || !led_cdev) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  261  				return -EPROBE_DEFER;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  262  			} else {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  263  				ret = PTR_ERR(led_cdev);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  264  				dev_err(dev, "Failed to get monochromatic LED for %s, error %d\n",
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  265  					vled->cdev.name, ret);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  266  				return ret;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  267  			}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  268  		}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  269  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  270  		vled->monochromatics[i] = led_cdev;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  271  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  272  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  273  	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  274  	if (ret)
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  275  		vled->cdev.max_brightness = LED_FULL;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  276  	else
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  277  		vled->cdev.max_brightness = max_brightness;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  278  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  279  	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  280  	vled->cdev.max_brightness = LED_FULL;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  281  	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  282  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  283  	init_data.fwnode = child_fwnode;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  284  	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  285  	if (ret) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  286  		dev_err(dev, "Failed to register virtual LED %s\n", vled->cdev.name);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  287  		return ret;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  288  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  289  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  290  	ret = device_create_file(vled->cdev.dev, &dev_attr_priority);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  291  	if (ret) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  292  		dev_err(dev, "Failed to create sysfs attribute for priority\n");
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  293  		return ret;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  294  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  295  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  296  	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_on);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  297  	if (ret) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  298  		dev_err(dev, "Failed to create sysfs attribute for blink_delay_on\n");
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  299  		return ret;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  300  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  301  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  302  	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_off);
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  303  	if (ret) {
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  304  		dev_err(dev, "Failed to create sysfs attribute for blink_delay_off\n");
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  305  		return ret;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  306  	}
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  307  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  308  	vled->vc_data = vc_data;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  309  
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  310  	return 0;
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  311  }
8ce5fa26ed391cb Jonathan Brophy 2025-09-16  312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

