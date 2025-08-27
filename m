Return-Path: <linux-leds+bounces-5324-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61041B379E6
	for <lists+linux-leds@lfdr.de>; Wed, 27 Aug 2025 07:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE86E4E0486
	for <lists+linux-leds@lfdr.de>; Wed, 27 Aug 2025 05:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5213A30F926;
	Wed, 27 Aug 2025 05:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0lqS2o9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582F38DEC;
	Wed, 27 Aug 2025 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756272834; cv=none; b=Q8M/XM8oRBnmfNXiw6AzvBV2P48ISSWZJUQfUBM/LTf3JwShmOrTfAlKWqkkdU3WLt6lIf07HbsC/53TBaa6b7AAtnSinFRqsZLTUEqLSMpjelGZgFrI/Dy4DpWuwvHjOxsKSLi1mFGgBIgEZBAHX6ERgqdj7xWvjXz6IGXqwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756272834; c=relaxed/simple;
	bh=5VFDz0Vkj2/2uTvvseBKlXbtMaFHG29kxehO+uaaK5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9pLRni2LPm2KEQPUlhm2QKMsgtMyKV2QZ36M2vaHSIx6C37WYEUhIsCalXy7hJ3jhSQMvY4zfpuM6lJJeh6MEmBH15EHNEfVHsHF3h70T4SzNoAvO8yLi/9T+Nwt2aQgMQQHOkThcvQJlpb/jjDq4PLMY7JfQyWNJyOYWAIBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0lqS2o9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756272832; x=1787808832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5VFDz0Vkj2/2uTvvseBKlXbtMaFHG29kxehO+uaaK5c=;
  b=K0lqS2o9wO+MeoMe5IGOEDgu0NwpsQVDpAgjOY3aRZgfM1EFPQcoLy4f
   Z0wdGkD8kG4YVwVUqmFoqmNEJS3R36OIv9WLhuf6SeVe+sHTFVBacHxv3
   D7QkvTosVsrBS9l+EgBAhjnAFcvEAxLTyAo0r48P2mz9g/W30tMlbaZPt
   dXt897IZwj+YkIMS4NWvGX2G4wTI78nLGyrlTSZk8AYCpz2YVG1lGTcvn
   R/mnmFLTD/raj5msFpNEd7ILHECrAdw9N32yuzbDLyn982UQdRGLcLPNC
   HUjhR5fxBn34UBk4BN20CkFELCd16MJ3ygEbfu4lXtJV9qoD6UiSoAiW9
   Q==;
X-CSE-ConnectionGUID: g5G9wxlVRgaikpPlLMJRaQ==
X-CSE-MsgGUID: YxDyeDIsTuqMlk6PjJ4sNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69889805"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69889805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 22:33:51 -0700
X-CSE-ConnectionGUID: vodw3LM7TjuitAkIRHSMpw==
X-CSE-MsgGUID: X0IBI55iQW+IF5BFOsX7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169000028"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Aug 2025 22:33:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur8mo-000Shv-2m;
	Wed, 27 Aug 2025 05:33:40 +0000
Date: Wed, 27 Aug 2025 13:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 3/4] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <202508271344.WqQr2aa7-lkp@intel.com>
References: <20250820163120.24997-4-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820163120.24997-4-jefflessard3@gmail.com>

Hi Jean-François,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc3 next-20250826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Fran-ois-Lessard/dt-bindings-vendor-prefixes-Add-fdhisi-titanmec-princeton-winrise-wxicore/20250821-003451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250820163120.24997-4-jefflessard3%40gmail.com
patch subject: [PATCH v3 3/4] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
config: x86_64-randconfig-r112-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271344.WqQr2aa7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271344.WqQr2aa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271344.WqQr2aa7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `tm16xx_i2c_write':
>> drivers/auxdisplay/tm16xx.c:1469: undefined reference to `i2c_transfer'
   ld: vmlinux.o: in function `tm16xx_i2c_read':
   drivers/auxdisplay/tm16xx.c:1497: undefined reference to `i2c_transfer'
   ld: vmlinux.o: in function `tm16xx_i2c_probe':
>> drivers/auxdisplay/tm16xx.c:1416: undefined reference to `i2c_get_match_data'
   ld: vmlinux.o: in function `tm16xx_i2c_register':
>> drivers/auxdisplay/tm16xx.c:1727: undefined reference to `i2c_register_driver'
   ld: vmlinux.o: in function `tm16xx_i2c_unregister':
>> drivers/auxdisplay/tm16xx.c:1732: undefined reference to `i2c_del_driver'


vim +1469 drivers/auxdisplay/tm16xx.c

  1401	
  1402	/* I2C specific code */
  1403	#if IS_ENABLED(CONFIG_I2C)
  1404	/**
  1405	 * tm16xx_i2c_probe() - Probe callback for I2C-attached controllers
  1406	 * @client: pointer to i2c_client
  1407	 *
  1408	 * Return: 0 on success, negative error code on failure
  1409	 */
  1410	static int tm16xx_i2c_probe(struct i2c_client *client)
  1411	{
  1412		const struct tm16xx_controller *controller;
  1413		struct tm16xx_display *display;
  1414		int ret;
  1415	
> 1416		controller = i2c_get_match_data(client);
  1417		if (!controller)
  1418			return -EINVAL;
  1419	
  1420		display = devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
  1421		if (!display)
  1422			return -ENOMEM;
  1423	
  1424		display->client.i2c = client;
  1425		display->dev = &client->dev;
  1426		display->controller = controller;
  1427	
  1428		i2c_set_clientdata(client, display);
  1429	
  1430		ret = tm16xx_probe(display);
  1431		if (ret)
  1432			return ret;
  1433	
  1434		return 0;
  1435	}
  1436	
  1437	/**
  1438	 * tm16xx_i2c_remove() - Remove callback for I2C-attached controllers
  1439	 * @client: pointer to i2c_client
  1440	 */
  1441	static void tm16xx_i2c_remove(struct i2c_client *client)
  1442	{
  1443		struct tm16xx_display *display = i2c_get_clientdata(client);
  1444	
  1445		tm16xx_display_remove(display);
  1446	}
  1447	
  1448	/**
  1449	 * tm16xx_i2c_write() - I2C write helper for controller
  1450	 * @display: pointer to tm16xx_display structure
  1451	 * @data: command and data bytes to send
  1452	 * @len: number of bytes in @data
  1453	 *
  1454	 * Return: 0 on success, negative error code on failure
  1455	 */
  1456	static int tm16xx_i2c_write(struct tm16xx_display *display, u8 *data, size_t len)
  1457	{
  1458		dev_dbg(display->dev, "i2c_write %*ph", (char)len, data);
  1459	
  1460		/* expected sequence: S Command [A] Data [A] P */
  1461		struct i2c_msg msg = {
  1462			.addr = data[0] >> 1,
  1463			.flags = 0,
  1464			.len = len - 1,
  1465			.buf = &data[1],
  1466		};
  1467		int ret;
  1468	
> 1469		ret = i2c_transfer(display->client.i2c->adapter, &msg, 1);
  1470		if (ret < 0)
  1471			return ret;
  1472	
  1473		return (ret == 1) ? 0 : -EIO;
  1474	}
  1475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

