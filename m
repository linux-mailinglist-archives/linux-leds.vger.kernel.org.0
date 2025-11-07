Return-Path: <linux-leds+bounces-6042-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A20C41BCA
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 22:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C163A9BF6
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 21:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B7834C9AB;
	Fri,  7 Nov 2025 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXBKZMj4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C134C804;
	Fri,  7 Nov 2025 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549589; cv=none; b=k7jb3dxmtcrmT2rQ0XTFKI8ybhYiVazsTFg0ZAGAlcTbe6av06qKB2AafQ8JAN6AY7naUdzDJrKb+5tloRXCQf5PM+KALjl8htha0Lia+WTDEHcM/uur99URqdZcapk/T6OkHPdjta83hzCcSUCgkJPCCDLzoBpEyOykDHSYvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549589; c=relaxed/simple;
	bh=s90W+PqOhJZw+tTu6G5O700n2F3C9OPDEv5k6C24h4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUuQBnf8DiKnjx8BsLSGKvyhcEzRFYQ0V7yAz9j6XZONWp52+4lZN4wpXHxx0riIpqOY71nrPuiPmUO5Ef1Pef04+XzI9XmjluSnVP1jc/9LQsD4LsjPXM+BepryQeaU6kPnP8HY0St0Jd15X8hYwu2Am6kNfqokwJJ7NcfcZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXBKZMj4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762549587; x=1794085587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s90W+PqOhJZw+tTu6G5O700n2F3C9OPDEv5k6C24h4w=;
  b=cXBKZMj4dCaG5QJKdTTWSsAIU9sM9+01tR98FQMmyFW3GrTo5JWVWVvf
   I7tIJDS2hKZJVm1aqDHbsAtodynw+gUZl23/KcATkY/Tf7mmCUbyz5Alb
   +k+G4fOG45DkyrENQnA1QvOfc0XiUnxNKGo/Vd3kcyJdWD6fTwsXMocwQ
   +WqRN3aTPqf8W76892GjWjEpopCwU7ICLCe1ER9rU0gYQE/cpIQ50x+Ej
   YbKScwNbzHDgPAy20j1tugz7090G11GxToZw/XPx689K6OEzIYyTNWFE9
   8hUcSiWQoUhOCwAmpavym1EV1rvDCmj++MG9JV4GnC522cikxPeXogY8I
   A==;
X-CSE-ConnectionGUID: X46KZVyiSkq4Cgo5nEKzDg==
X-CSE-MsgGUID: varOPppVQVibHN9J0NqkaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="90173475"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="90173475"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 13:06:26 -0800
X-CSE-ConnectionGUID: 4zmO05DxQuGjVTeTZpBvkw==
X-CSE-MsgGUID: QB+bLE7EQouO/WNw+EhCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="218787805"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 13:06:24 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHTf3-0000Mt-1W;
	Fri, 07 Nov 2025 21:06:21 +0000
Date: Sat, 8 Nov 2025 05:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Richard Leitner <richard.leitner@linux.dev>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <202511080412.AYpJ1DIq-lkp@intel.com>
References: <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2f112b1c25da9f5346c2261ed35c5b1e0b906471]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-v4l-ctrls-add-a-control-for-flash-strobe-duration/20251104-225658
base:   2f112b1c25da9f5346c2261ed35c5b1e0b906471
patch link:    https://lore.kernel.org/r/20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a%40linux.dev
patch subject: [PATCH v8 7/8] media: i2c: ov9282: implement try_ctrl for strobe_duration
config: xtensa-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251108/202511080412.AYpJ1DIq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080412.AYpJ1DIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080412.AYpJ1DIq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/media/i2c/ov9282.o:(.text+0xc): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/media/i2c/ov9282.o: in function `ov9282_try_ctrl':
>> ov9282.c:(.text+0x62): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/media/i2c/ov9282.o:(.text+0x10): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/media/i2c/ov9282.o: in function `ov9282_try_ctrl':
   ov9282.c:(.text+0x7e): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

