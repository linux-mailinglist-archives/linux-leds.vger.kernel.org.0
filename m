Return-Path: <linux-leds+bounces-3346-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4719C1D29
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF209285E58
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 12:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645EF1E7C1B;
	Fri,  8 Nov 2024 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSJgyTc2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542D1E47D9;
	Fri,  8 Nov 2024 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069652; cv=none; b=r4VYlDx6WK5RKuz9NyIbY3Net+eOjcF2q82yiHQkuz6CdnCegvnu1UH5maNQkwDUIdeKcEsrhWjcjSCiOqegR2pxQqLBLSEtldxg7fo3cYmiqJVs3ZIwcl3IiSUcQAaBWktPbGNbaIMhUlLAWcVU13jIOuV8866DYxjwz2gLNU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069652; c=relaxed/simple;
	bh=UKvKggqPEPvzWSsamB4vY+rjWQ9oIe3nzf9VUWVuo9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDbQUy96KaE3VR1cAt+cNbcog/8IATIuYLjbDR4p3Vp5ptFy4OZ4HfyXQBJDBzaNbP6/n66LLoTAWs6V00B0sczYgWArx106/EUlrVfa+UJeHzwDiu43q+VoXwjimy2uJvkEbx5fucj82WODFaqCiVmJn18sGj/3KiAuijWAsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSJgyTc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A201C4CECE;
	Fri,  8 Nov 2024 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731069651;
	bh=UKvKggqPEPvzWSsamB4vY+rjWQ9oIe3nzf9VUWVuo9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSJgyTc2C/pdKPz2jRI3WAv07XAuFDR766GzMLiVHJMcE9x1ybiBJKQdmq3WrjhAG
	 UxC8d3jBAa577xmGvoxxg5tlmNnp2r6HdhDx6LSVgY9yXEthuKHrQCT5OFC/IWiw9l
	 taBICZ3yY51PKerjizOZAyfugyLTIqdkb+wuGbSLiOSB/A+EJeIqviokWgu6cb0qO3
	 7e19yqAeZN89+xUV4G+CMKDU8YHLoyWM8dP+Q12Q6IGyDZJHdmuh8Lnmzewnvs7gws
	 hM+ULZbP0o9GYveDprQE8s7vH8C6l1nh+z9ULXxtxJ4zUwTnvbSRoedTH1UmXRFm7t
	 Vx/k+Llb0WvoQ==
Date: Fri, 8 Nov 2024 13:40:45 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: kernel test robot <lkp@intel.com>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <iez6ilisqdaguwkxofc3njwqjtooneydzflxep4oafcsqujmnt@sjjybtqpzebz>
References: <20241104141924.18816-8-kabel@kernel.org>
 <202411051138.jzDE6sBH-lkp@intel.com>
 <20241106102919.GO1807686@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106102919.GO1807686@google.com>

On Wed, Nov 06, 2024 at 10:29:19AM +0000, Lee Jones wrote:
> On Tue, 05 Nov 2024, kernel test robot wrote:
> 
> > Hi Marek,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.12-rc6]
> > [cannot apply to lee-leds/for-leds-next robh/for-next next-20241104]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20241104-223435
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20241104141924.18816-8-kabel%40kernel.org
> > patch subject: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
> > config: arm-randconfig-003-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411051138.jzDE6sBH-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_set_color':
> > >> include/linux/turris-omnia-mcu-interface.h:275:(.text+0x5a): undefined reference to `omnia_cmd_write_read'
> >    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_read_u16':
> >    include/linux/turris-omnia-mcu-interface.h:311:(.text+0xaa): undefined reference to `omnia_cmd_write_read'
> >    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `gamma_correction_show':
> >    include/linux/turris-omnia-mcu-interface.h:311:(.text+0x1a2): undefined reference to `omnia_cmd_write_read'
> >    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_write_u8':
> >    include/linux/turris-omnia-mcu-interface.h:275:(.text+0x1c8): undefined reference to `omnia_cmd_write_read'
> >    arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `brightness_show':
> >    include/linux/turris-omnia-mcu-interface.h:311:(.text+0x4c2): undefined reference to `omnia_cmd_write_read'
> > 
> > 
> > vim +275 include/linux/turris-omnia-mcu-interface.h
> > 
> > 9f74fe5691025f Marek Behún 2024-11-04  267  
> > 9f74fe5691025f Marek Behún 2024-11-04  268  int omnia_cmd_write_read(const struct i2c_client *client,
> > 9f74fe5691025f Marek Behún 2024-11-04  269  			 void *cmd, unsigned int cmd_len,
> > 9f74fe5691025f Marek Behún 2024-11-04  270  			 void *reply, unsigned int reply_len);
> > 9f74fe5691025f Marek Behún 2024-11-04  271  
> > 9f74fe5691025f Marek Behún 2024-11-04  272  static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
> > 9f74fe5691025f Marek Behún 2024-11-04  273  				  unsigned int len)
> > 9f74fe5691025f Marek Behún 2024-11-04  274  {
> > 9f74fe5691025f Marek Behún 2024-11-04 @275  	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
> > 9f74fe5691025f Marek Behún 2024-11-04  276  }
> > 9f74fe5691025f Marek Behún 2024-11-04  277  
> 
> Is this real or a false positive?

It is real. Happens when LEDS_TURRIS_OMNIA=y and TURRIS_OMNIA_MCU=m.
LEDS_TURRIS_OMNIA must depend on both TURRIS_OMNIA_MCU and
TURRIS_OMNIA_MCU_GPIO, not just the latter.

