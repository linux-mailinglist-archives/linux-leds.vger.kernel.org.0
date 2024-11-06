Return-Path: <linux-leds+bounces-3307-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3D9BE445
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76841C22CB5
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF871DE2BA;
	Wed,  6 Nov 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWVoEQR+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD461DE2B3;
	Wed,  6 Nov 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888965; cv=none; b=eMuo+dUObMcLgsm5AAYSLVR0xfo+a49wulkVodOYenCMF4IfjLmqjX4s86L/Ox8rHOpgbtou79DEY4scfgEpzG8feXD3zsWkjD6FPvWUbxCM+K2KdEWaQGuv6bBpGQI0J12CtkdEft2FQkcZw6Jn1SwO+8nUMhRgizw51+BvdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888965; c=relaxed/simple;
	bh=dCOrapuzIiMl62SifakxF2zKgwFO7pO+TdVUpeX5vgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTG7oPsF9622GznQBiueJJndvNb81k3cz49z5ohHtYVD8YY/VNu7TF68JGC/X4M1lN5oo1rQuvdSwOj0SpE00sExJvIWkgpHLRrPVL7ptZpTtYHq/FLGXEtierCr+5/N4yeR78bcszo/ode/Wqpna0+JEVL0jgJcE5Ii6FGdMs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWVoEQR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD82BC4CED0;
	Wed,  6 Nov 2024 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730888965;
	bh=dCOrapuzIiMl62SifakxF2zKgwFO7pO+TdVUpeX5vgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWVoEQR+Vsdm+BPK4SgGLUOdZpycUyD86tm2nYqBVmAonAZxrumicm0ppt6PdG++n
	 5/cWINc/y2/fUR3TTLRU/qG276InZZC9n1M7o90Y5fFqYMrR9Gx746+EMegOWl40/h
	 kIZKdG/+rExxrjZnozfJ4lzRXgO2Dj10jfPcI23RuWYq/jBxRrlaDoAkDrglk2FNh0
	 j2PqnRnyRz7Jj2ZGTw8REeRjZ1TQLVcaK5QLNbWx/IUdRlPSoUn30Afg3Yyl6wQdpo
	 UwDkP4uU8tZdBqULFGO7k6HuOYbAzEnYfztsXX+E9s3DJsw/vaIiGcpwWqErboM3AR
	 pOymkTdn+mhHQ==
Date: Wed, 6 Nov 2024 10:29:19 +0000
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <20241106102919.GO1807686@google.com>
References: <20241104141924.18816-8-kabel@kernel.org>
 <202411051138.jzDE6sBH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411051138.jzDE6sBH-lkp@intel.com>

On Tue, 05 Nov 2024, kernel test robot wrote:

> Hi Marek,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.12-rc6]
> [cannot apply to lee-leds/for-leds-next robh/for-next next-20241104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20241104-223435
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20241104141924.18816-8-kabel%40kernel.org
> patch subject: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
> config: arm-randconfig-003-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411051138.jzDE6sBH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_set_color':
> >> include/linux/turris-omnia-mcu-interface.h:275:(.text+0x5a): undefined reference to `omnia_cmd_write_read'
>    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_read_u16':
>    include/linux/turris-omnia-mcu-interface.h:311:(.text+0xaa): undefined reference to `omnia_cmd_write_read'
>    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `gamma_correction_show':
>    include/linux/turris-omnia-mcu-interface.h:311:(.text+0x1a2): undefined reference to `omnia_cmd_write_read'
>    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_write_u8':
>    include/linux/turris-omnia-mcu-interface.h:275:(.text+0x1c8): undefined reference to `omnia_cmd_write_read'
>    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `brightness_show':
>    include/linux/turris-omnia-mcu-interface.h:311:(.text+0x4c2): undefined reference to `omnia_cmd_write_read'
> 
> 
> vim +275 include/linux/turris-omnia-mcu-interface.h
> 
> 9f74fe5691025f Marek Behún 2024-11-04  267  
> 9f74fe5691025f Marek Behún 2024-11-04  268  int omnia_cmd_write_read(const struct i2c_client *client,
> 9f74fe5691025f Marek Behún 2024-11-04  269  			 void *cmd, unsigned int cmd_len,
> 9f74fe5691025f Marek Behún 2024-11-04  270  			 void *reply, unsigned int reply_len);
> 9f74fe5691025f Marek Behún 2024-11-04  271  
> 9f74fe5691025f Marek Behún 2024-11-04  272  static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
> 9f74fe5691025f Marek Behún 2024-11-04  273  				  unsigned int len)
> 9f74fe5691025f Marek Behún 2024-11-04  274  {
> 9f74fe5691025f Marek Behún 2024-11-04 @275  	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
> 9f74fe5691025f Marek Behún 2024-11-04  276  }
> 9f74fe5691025f Marek Behún 2024-11-04  277  

Is this real or a false positive?

-- 
Lee Jones [李琼斯]

