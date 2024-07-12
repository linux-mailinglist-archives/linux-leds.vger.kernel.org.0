Return-Path: <linux-leds+bounces-2273-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87592F32E
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 02:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCC101F22C05
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 00:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41427E6;
	Fri, 12 Jul 2024 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME0UQCWd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E511FAA
	for <linux-leds@vger.kernel.org>; Fri, 12 Jul 2024 00:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720745311; cv=none; b=HbiW63pk7AJur4pF28mBcg+hekmNd1u6q5iaG6Ai5xZvU6NUWuLwo3EkOBbGYkSBNBqnFDJHqWOS6bvuCnCqkma72n1mjfO80Sw9p8odh4fMps4wXElOQWfWzyd7JpAdKRUzpKmnnbIyLLAmD4Bzh6jQXYx3bwuy/hK16TtN+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720745311; c=relaxed/simple;
	bh=xkVi1o8ntr2tA0ADAicDYVz8gQ7R3bwZyTxqdUketQM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laOPNjJYL8nvUfEWfBSzR7PA+UqJK6mNC/szH1jeYP8Gi7KxAAJxRbzMctGUs6HRnKz1LnP0p2C4d6hoqSNIoD7elRNybajXHFVs3wjoplJgt56dr5qIcJZlySmRw3n8Ah3PuVK+qsnthWqCUztjtVj6IYzIE1b3sPdCc+80IDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME0UQCWd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367a464e200so803316f8f.2
        for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2024 17:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720745308; x=1721350108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mgAMYB1dbIUxzICdtsXRqVxV1gd6vtwgSSHEhcymkbQ=;
        b=ME0UQCWdBu29OE3/yFKnrEGeTk7x/cQFVaxfJcXHg7OVqNVs4aaTkQhQM8a1L/A8Vs
         84cVs+ELmGgy92G2paqclQmQWp4GiCZxeRsA6wx2qJ7Xb6D+seAELX2biT3nDtI8rwZE
         50w8hzX93+WFsnsflosixmj1P3/izTP2/nN2wDVqC8D2QU4VFVDcImXGnC3htjWZZkJB
         G7U3xBbRHw2RGdcGAlRf5bWsWB8UyQ89527sZBVBLWq8L8hThggD6IcL8YeuJO5KqVdC
         mfYim0jXQAnuUfL81qrBmwUOJj0w6PTSVbsyLGlJJO9bDSTY7xik/D3OQ5sdEQ6YwdG9
         84xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720745308; x=1721350108;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgAMYB1dbIUxzICdtsXRqVxV1gd6vtwgSSHEhcymkbQ=;
        b=LMCi8EtgTg8npDLKq3ARn+un4UuCCehg7ao0mESMHGK8Y7VsA4ukJMpXfR4M9j3cxP
         hnUoe6CrEyJyLSYPUsCBR8T4Rc+UskQ7f0eseyngxJded6lTE7V3AdPfEOunMiSIJyO4
         loKJhFNBOJIE4it8trcxhbINrSFt9Ngw25uTX3kaZyh0H5lboKb4G49C5eXtfqyO+5p8
         YGsx0rneHd2cy2QF51VzjBV4UNVWou0rprZcRdyR4bb74nUgFMP2fPpmRd6QlfXun8sT
         aA4qkj6OveYWFl5T9KXuTFd1skVlQlsb1tNSTPUUcjm6+rYHP8JCidadCD5BGtAHf6Re
         z38A==
X-Forwarded-Encrypted: i=1; AJvYcCWKLuyz6fiFT4sjo5sJfqBLEa/5LgPelQSpgKynZW+zqppI77cFyai1uHJC32bnj/kdAHWG4UhrSWe/6nVemgi2je3kcglj7l3yDA==
X-Gm-Message-State: AOJu0YwlfPbWdWXOY9SuW2gxE4LbWQNtIxPSuJajTSCKBoEezOauZBOR
	IsN0JozfMFGPTCwqlVDLi7kQRB3yef+hiy/3+J+1my6t1BLqQ1GeinLE4Q==
X-Google-Smtp-Source: AGHT+IGp7U+x+do7iIkxGfbwAap0hFo+FCXoFMY1/PblenL9ZBcwY0OpDS6cHtP2lZOtMxr56susng==
X-Received: by 2002:a05:6000:1b01:b0:367:4e1a:240e with SMTP id ffacd0b85a97d-367ceaca8ebmr6546146f8f.50.1720745308216;
        Thu, 11 Jul 2024 17:48:28 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0613sm8970736f8f.88.2024.07.11.17.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 17:48:27 -0700 (PDT)
Message-ID: <66907d5b.5d0a0220.29a1d.3d30@mx.google.com>
X-Google-Original-Message-ID: <ZpB9WhHAbbapwwhw@Ansuel-XPS.>
Date: Fri, 12 Jul 2024 02:48:26 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [lee-leds:for-leds-next 65/65]
 drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of
 'lp55xx_read' from incompatible pointer type
References: <202407120702.K20luS0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407120702.K20luS0E-lkp@intel.com>

On Fri, Jul 12, 2024 at 07:35:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> head:   d9cc80b1c9b40a33c022e125b7f9555813c7f385
> commit: d9cc80b1c9b40a33c022e125b7f9555813c7f385 [65/65] leds: leds-lp5569: Enable chip after chip configuration
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120702.K20luS0E-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120702.K20luS0E-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407120702.K20luS0E-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/leds/leds-lp5569.c:11:
>    drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
> >> drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Wincompatible-pointer-types]
>      204 |                           chip, LP5569_REG_STATUS, &val);
>          |                                                    ^~~~
>          |                                                    |
>          |                                                    int *
>    include/linux/iopoll.h:46:28: note: in definition of macro 'read_poll_timeout'
>       46 |                 (val) = op(args); \
>          |                            ^~~~
>    In file included from drivers/leds/leds-lp5569.c:20:
>    drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'int *'
>      229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
>          |                                                          ~~~~^~~
> >> drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Wincompatible-pointer-types]
>      204 |                           chip, LP5569_REG_STATUS, &val);
>          |                                                    ^~~~
>          |                                                    |
>          |                                                    int *
>    include/linux/iopoll.h:51:36: note: in definition of macro 'read_poll_timeout'
>       51 |                         (val) = op(args); \
>          |                                    ^~~~
>    drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'int *'
>      229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
>          |                                                          ~~~~^~~
> 
> 
> vim +/lp55xx_read +204 drivers/leds/leds-lp5569.c

Hi Lee,

I just sent v2 of the series that fix this warning. Hope it can be
reverted and v2 applied instead!

> 
>    171	
>    172	static int lp5569_post_init_device(struct lp55xx_chip *chip)
>    173	{
>    174		int ret;
>    175		int val;
>    176	
>    177		val = LP5569_DEFAULT_CONFIG;
>    178		val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
>    179		ret = lp55xx_write(chip, LP5569_REG_MISC, val);
>    180		if (ret)
>    181			return ret;
>    182	
>    183		if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
>    184			/* Internal clock MUST be configured before CLK output */
>    185			ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
>    186						 LP5569_INTERNAL_CLK,
>    187						 LP5569_INTERNAL_CLK);
>    188			if (ret)
>    189				return ret;
>    190	
>    191			ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
>    192						 LP5569_CLK_OUTPUT,
>    193						 LP5569_CLK_OUTPUT);
>    194			if (ret)
>    195				return ret;
>    196		}
>    197	
>    198		ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
>    199		if (ret)
>    200			return ret;
>    201	
>    202		read_poll_timeout(lp55xx_read, ret, !(val & LP5569_STARTUP_BUSY),
>    203				  LP5569_STARTUP_SLEEP, LP5569_STARTUP_SLEEP * 10, false,
>  > 204				  chip, LP5569_REG_STATUS, &val);
>    205	
>    206		return lp5569_init_program_engine(chip);
>    207	}
>    208	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
	Ansuel

