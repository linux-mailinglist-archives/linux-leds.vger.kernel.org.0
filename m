Return-Path: <linux-leds+bounces-4949-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B563DAEEC1B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 03:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 161D917FFD3
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 01:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AB0189BB0;
	Tue,  1 Jul 2025 01:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9Tk1TsG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E311885B8;
	Tue,  1 Jul 2025 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751333681; cv=none; b=OfrFLIauBRPj1Tg24zLD5vo4nnroYXPD+tb05HSllatglcURu5nE4SdNKH55heRQC5rlTqTcA6kCTluIfOzbR8iZximVwkHdozqzITDG/jaDUzbE3KKt4iQ9FWzLYrorsD1VSv3+x6cU+LqCk9+aYxY4SV9MNjQcosvaj4Ic25M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751333681; c=relaxed/simple;
	bh=a4+o2VVpIqo+v/jlD6XNim1oDEttyTg1jwqAtEEmicE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0eUs0uFtrbRmfH5eZ0YJLEn1qrP/vLLOGSzIau7NEnm7LzVRAQ+Sfqy4GGv/OFw/Dg2Fbz7oXZ/ngYo8m7TCusQ5fnOOSWZDOGE+qIHWsuWjgMqKDbT4svCuxaspkOWKnRhYwojCSI4ybZL8drU7AdBcGaIkL3sYSrGEZDvv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9Tk1TsG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751333680; x=1782869680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a4+o2VVpIqo+v/jlD6XNim1oDEttyTg1jwqAtEEmicE=;
  b=n9Tk1TsGxhqF09UxzgtN139Ur5xe0IPsYisE/t/uZuH0SlE5WMmYNytf
   rgSLhUOLFuv/uIo+zkCWhEIbrC76MRQxkkzdcVYyB1nW/ICr+K6dbyRJM
   2G5tjsnuM71NVMJ2mzEIFME+FEYISsjWIzADRDdG83DqHpgxqEgJaxBeS
   +crsttERx4rtNZhqUIJOt0U4t03/skJ+Y4wBHRCjzUap/oN+VNcrGr8fi
   GR/E12KrNHOtekPsXvqgffito3szyv0QLHBvX7JpOuanXJdj0P5pSP/3x
   8Zv81B9gqeLG1h/QMj6WtGfwjoPLPf2fucGdfHaKk7g2s2wQJdXKtLVSG
   w==;
X-CSE-ConnectionGUID: IVAkEgRrQpW/hS0ESEEtaA==
X-CSE-MsgGUID: 2jgKi9SvRFqZbHgMDLcpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53515328"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53515328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:34:38 -0700
X-CSE-ConnectionGUID: JpGsI+9mQlO99aCifxmnlw==
X-CSE-MsgGUID: sy5b9sEiTcuafp05lbwY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184651912"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2025 18:33:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWPsd-000ZVi-0m;
	Tue, 01 Jul 2025 01:33:51 +0000
Date: Tue, 1 Jul 2025 09:32:59 +0800
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
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
Message-ID: <202507010941.mDtYLPDi-lkp@intel.com>
References: <20250629131830.50034-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629131830.50034-1-jefflessard3@gmail.com>

Hi Jean-François,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc4 next-20250630]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Fran-ois-Lessard/dt-bindings-vendor-prefixes-Add-Fuda-Hisi-Microelectronics/20250630-010326
base:   linus/master
patch link:    https://lore.kernel.org/r/20250629131830.50034-1-jefflessard3%40gmail.com
patch subject: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display controllers driver
config: um-randconfig-r053-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010941.mDtYLPDi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010941.mDtYLPDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010941.mDtYLPDi-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/12/libgcov.a(_gcov.o): in function `mangle_path':
   (.text+0x1f00): multiple definition of `mangle_path'; fs/seq_file.o:fs/seq_file.c:441: first defined here
   /usr/bin/ld: drivers/auxdisplay/tm16xx.o: in function `spi_sync_transfer':
>> include/linux/spi/spi.h:1464: undefined reference to `spi_sync'
   /usr/bin/ld: drivers/auxdisplay/tm16xx.o: in function `tm16xx_init':
>> drivers/auxdisplay/tm16xx.c:1279: undefined reference to `__spi_register_driver'
   collect2: error: ld returned 1 exit status


vim +1464 include/linux/spi/spi.h

8ae12a0d85987d David Brownell     2006-01-08  1442  
323117ab60156d Geert Uytterhoeven 2016-09-13  1443  /**
323117ab60156d Geert Uytterhoeven 2016-09-13  1444   * spi_sync_transfer - synchronous SPI data transfer
323117ab60156d Geert Uytterhoeven 2016-09-13  1445   * @spi: device with which data will be exchanged
323117ab60156d Geert Uytterhoeven 2016-09-13  1446   * @xfers: An array of spi_transfers
323117ab60156d Geert Uytterhoeven 2016-09-13  1447   * @num_xfers: Number of items in the xfer array
323117ab60156d Geert Uytterhoeven 2016-09-13  1448   * Context: can sleep
323117ab60156d Geert Uytterhoeven 2016-09-13  1449   *
323117ab60156d Geert Uytterhoeven 2016-09-13  1450   * Does a synchronous SPI data transfer of the given spi_transfer array.
323117ab60156d Geert Uytterhoeven 2016-09-13  1451   *
323117ab60156d Geert Uytterhoeven 2016-09-13  1452   * For more specific semantics see spi_sync().
323117ab60156d Geert Uytterhoeven 2016-09-13  1453   *
2ae3de10abfe0b Randy Dunlap       2020-07-15  1454   * Return: zero on success, else a negative error code.
323117ab60156d Geert Uytterhoeven 2016-09-13  1455   */
323117ab60156d Geert Uytterhoeven 2016-09-13  1456  static inline int
323117ab60156d Geert Uytterhoeven 2016-09-13  1457  spi_sync_transfer(struct spi_device *spi, struct spi_transfer *xfers,
323117ab60156d Geert Uytterhoeven 2016-09-13  1458  	unsigned int num_xfers)
323117ab60156d Geert Uytterhoeven 2016-09-13  1459  {
323117ab60156d Geert Uytterhoeven 2016-09-13  1460  	struct spi_message msg;
323117ab60156d Geert Uytterhoeven 2016-09-13  1461  
323117ab60156d Geert Uytterhoeven 2016-09-13  1462  	spi_message_init_with_transfers(&msg, xfers, num_xfers);
323117ab60156d Geert Uytterhoeven 2016-09-13  1463  
323117ab60156d Geert Uytterhoeven 2016-09-13 @1464  	return spi_sync(spi, &msg);
323117ab60156d Geert Uytterhoeven 2016-09-13  1465  }
323117ab60156d Geert Uytterhoeven 2016-09-13  1466  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

