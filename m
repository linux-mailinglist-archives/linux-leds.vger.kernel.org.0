Return-Path: <linux-leds+bounces-1719-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE58D3982
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 16:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5308C1F232A3
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 14:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1AB15CD6A;
	Wed, 29 May 2024 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMo/J1Ub"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C313E15AD86;
	Wed, 29 May 2024 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993587; cv=none; b=NnSHvjDKP7IFY/L8KiJ2ZW3DndUsVWTmDN5EpHe3l/fPfGvNdftGX3Fdg/PkXsDSLd5PYarT+1YN4fpmguV0jD/5wuog1SU1BxgSrSJ4BaW5yjtu9nW2N1PTGuxF5V62vzHA9W4XObiFa55sZR3v3NBXfFQ9R7S6SYQE85s8u+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993587; c=relaxed/simple;
	bh=+7lzzUzJGgXMBccWlEUAK8WAPNKktuWs7wc3Hg3pPtU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2Y/mho6ve5vjr2NIiqbMcP4AxLyvICjeKy1j1ZkDj1tKu/NWbFnem0ca63QQd5WXb1CffApUWhW9oL8sWLU2HtsUHEmb9wFuHd6+pLPtBMCRQYNzZcerb5GSG7QLNUgzYkNNoOhcZvtPoMsAYmbYRFf/6BlHedpyrsYnzarSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMo/J1Ub; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42121d27861so10671745e9.0;
        Wed, 29 May 2024 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716993584; x=1717598384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ibpy32+dFO/lcZskkUu9jbWqhVqkGGZ+uttQqfSwDdk=;
        b=YMo/J1UbcVq7HgglqnHc8BGvr+MfNraSSifHpqCjcYd2m+N7uWjOGoQCQUfyg8SLMw
         nJDEN6QUlE9nnby2pskl1FFeMjULqXzx6CWxO2jmggozrwkgR9Hg3ZcPxbaJWVl+Itvz
         tG7/q75KfRvBdv5bJ2jYrThYAedWVZOGFc8eJC3tV4KnKS0AGXaXJE79ESSeAVSS32xI
         BUEv8jzZfwEQI9UzY6NRz0rHZLV6HLhqEh/OATqYiBcDMtY9dufvJ5mk1GwpXJtlK7gk
         ygU1MHVVN9a2LStBJ2B/p/LdQs1AvAqsTfOcJqwStfu+qBIRQuN9LNQ6qnr9DqmmzGio
         eH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993584; x=1717598384;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ibpy32+dFO/lcZskkUu9jbWqhVqkGGZ+uttQqfSwDdk=;
        b=CvJ2t7b0FUNA96HdqdIOmW5+uaXgsXyLJLezD7v2Uh0QL5wumBFlkRCEGhaf/K00oI
         lMjF7fZEvj5T30ihcbLYVdl043Br841GgDB94lQHg5rjeNE6kqFg4a/qYNOxyowymRxI
         IXrSqzOdKyEYD0Kb6gYgpbJJeVyFkCnAhFaTxQcQNeMBE56ip7bHCpkZ18QM/2hVCe/q
         zlkdlzYk1YGaX3S1Nz4aNHNi7Bpe32r8749GTL8spWaCga6ycuCeKxQtkTvH4xXIf58T
         IiyZnNuaU2j+8YsYop+zct9fNsXy1NAsKmomhfFPS5W8bTtxWDcr+ex2BiFbuut4ZU+y
         Qr9A==
X-Forwarded-Encrypted: i=1; AJvYcCVq/X1a+Dy3uEm1kmDyhSuFBoAOC4VapzGy74jEdwYGmHlS6vd2JQYM3I4K5sD0QKD92X8NNsokaYtfYluQbgqWCkQBGeR+o36NC50oCpWvDxHXntB7WW4VIfX4qY0TUR54Rq4E8krbkLgq4AoHht+OtUTpybtehMmImNRQP3giaAOJt8Y=
X-Gm-Message-State: AOJu0Yzh8G7jmQGOt7iebxz8CQJnl8iiQe3JbHk/Uk/qlx0edTpNpjb2
	0JFOL3Jbuv7ITR+AEWgTLdYaYf1iCu7GRw5faajRW7dovVfLrqmROcbMHA==
X-Google-Smtp-Source: AGHT+IF/66n4nH3mHwStiq+QQr9At/NmFho2BOE/s+vlEyKYny/ioEw+zi5g5rQzQ2LIzlkES75zgQ==
X-Received: by 2002:a05:600c:45cd:b0:420:29dd:84db with SMTP id 5b1f17b1804b1-42108a26c56mr138485295e9.35.1716993583841;
        Wed, 29 May 2024 07:39:43 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089ccb10sm181585805e9.44.2024.05.29.07.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:39:43 -0700 (PDT)
Message-ID: <66573e2f.050a0220.4afa0.0925@mx.google.com>
X-Google-Original-Message-ID: <Zlc-Li5bKgD9Ou-p@Ansuel-XPS.>
Date: Wed, 29 May 2024 16:39:42 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
References: <20240527094737.13354-3-ansuelsmth@gmail.com>
 <1f970609-42fa-4e6d-95d3-7ccdf52d3fee@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f970609-42fa-4e6d-95d3-7ccdf52d3fee@moroto.mountain>

On Wed, May 29, 2024 at 05:32:16PM +0300, Dan Carpenter wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240527-174959
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> patch link:    https://lore.kernel.org/r/20240527094737.13354-3-ansuelsmth%40gmail.com
> patch subject: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
> config: sparc-randconfig-r071-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280611.QUICzlRj-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202405280611.QUICzlRj-lkp@intel.com/
> 
> New smatch warnings:
> drivers/leds/leds-lp5569.c:378 lp5569_update_program_memory() error: buffer overflow 'pattern' 128 <= 223
> 
> vim +/pattern +378 drivers/leds/leds-lp5569.c
> 
> ed7ae4f43e228c Christian Marangi 2024-05-27  340  static int lp5569_update_program_memory(struct lp55xx_chip *chip,
> ed7ae4f43e228c Christian Marangi 2024-05-27  341  					const u8 *data, size_t size)
> ed7ae4f43e228c Christian Marangi 2024-05-27  342  {
> ed7ae4f43e228c Christian Marangi 2024-05-27  343  	enum lp55xx_engine_index idx = chip->engine_idx;
> ed7ae4f43e228c Christian Marangi 2024-05-27  344  	u8 pattern[LP5569_PROGRAM_LENGTH] = {0};
> ed7ae4f43e228c Christian Marangi 2024-05-27  345  	unsigned int cmd;
> ed7ae4f43e228c Christian Marangi 2024-05-27  346  	char c[3];
> ed7ae4f43e228c Christian Marangi 2024-05-27  347  	int nrchars;
> ed7ae4f43e228c Christian Marangi 2024-05-27  348  	int ret;
> ed7ae4f43e228c Christian Marangi 2024-05-27  349  	int offset = 0;
> ed7ae4f43e228c Christian Marangi 2024-05-27  350  	int page, i = 0;
> ed7ae4f43e228c Christian Marangi 2024-05-27  351  
> ed7ae4f43e228c Christian Marangi 2024-05-27  352  	while ((offset < size - 1) && (i < LP5569_PROGRAM_LENGTH)) {
> ed7ae4f43e228c Christian Marangi 2024-05-27  353  		/* separate sscanfs because length is working only for %s */
> ed7ae4f43e228c Christian Marangi 2024-05-27  354  		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
> ed7ae4f43e228c Christian Marangi 2024-05-27  355  		if (ret != 1)
> ed7ae4f43e228c Christian Marangi 2024-05-27  356  			goto err;
> ed7ae4f43e228c Christian Marangi 2024-05-27  357  
> ed7ae4f43e228c Christian Marangi 2024-05-27  358  		ret = sscanf(c, "%2x", &cmd);
> ed7ae4f43e228c Christian Marangi 2024-05-27  359  		if (ret != 1)
> ed7ae4f43e228c Christian Marangi 2024-05-27  360  			goto err;
> ed7ae4f43e228c Christian Marangi 2024-05-27  361  
> ed7ae4f43e228c Christian Marangi 2024-05-27  362  		pattern[i] = (u8)cmd;
> ed7ae4f43e228c Christian Marangi 2024-05-27  363  		offset += nrchars;
> ed7ae4f43e228c Christian Marangi 2024-05-27  364  		i++;
> ed7ae4f43e228c Christian Marangi 2024-05-27  365  	}
> ed7ae4f43e228c Christian Marangi 2024-05-27  366  
> ed7ae4f43e228c Christian Marangi 2024-05-27  367  	/* Each instruction is 16bit long. Check that length is even */
> ed7ae4f43e228c Christian Marangi 2024-05-27  368  	if (i % 2)
> ed7ae4f43e228c Christian Marangi 2024-05-27  369  		goto err;
> ed7ae4f43e228c Christian Marangi 2024-05-27  370  
> ed7ae4f43e228c Christian Marangi 2024-05-27  371  	for (page = 0; page < LP5569_PROGRAM_LENGTH / LP5569_BYTES_PER_PAGE; page++) {
> ed7ae4f43e228c Christian Marangi 2024-05-27  372  		/* Write to the next page each 32 bytes */
> ed7ae4f43e228c Christian Marangi 2024-05-27  373  		lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL,
> ed7ae4f43e228c Christian Marangi 2024-05-27  374  			     LP5569_PAGE_ENG(idx) + page);
> ed7ae4f43e228c Christian Marangi 2024-05-27  375  
> ed7ae4f43e228c Christian Marangi 2024-05-27  376  		for (i = 0; i < LP5569_PROGRAM_LENGTH; i++) {
> ed7ae4f43e228c Christian Marangi 2024-05-27  377  			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + i,
> ed7ae4f43e228c Christian Marangi 2024-05-27 @378  					   pattern[i + (page * LP5569_BYTES_PER_PAGE)]);
>                                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> i can co up to LP5569_PROGRAM_LENGTH and "page * LP5569_BYTES_PER_PAGE"
> can also go up to LP5569_PROGRAM_LENGTH.  So we're 2x beyond the end of
> the array.
>

Yes the second loop max value should have been LP5569_BYTES_PER_PAGE,
totally a copy paste error on my side.

Thanks a lot for warning about this bug, will send new version with this
fixed.

> ed7ae4f43e228c Christian Marangi 2024-05-27  379  			if (ret)
> ed7ae4f43e228c Christian Marangi 2024-05-27  380  				return -EINVAL;
> ed7ae4f43e228c Christian Marangi 2024-05-27  381  		}
> ed7ae4f43e228c Christian Marangi 2024-05-27  382  	}
> ed7ae4f43e228c Christian Marangi 2024-05-27  383  
> ed7ae4f43e228c Christian Marangi 2024-05-27  384  
> ed7ae4f43e228c Christian Marangi 2024-05-27  385  	return size;
> ed7ae4f43e228c Christian Marangi 2024-05-27  386  
> ed7ae4f43e228c Christian Marangi 2024-05-27  387  err:
> ed7ae4f43e228c Christian Marangi 2024-05-27  388  	dev_err(&chip->cl->dev, "wrong pattern format\n");
> ed7ae4f43e228c Christian Marangi 2024-05-27  389  	return -EINVAL;
> ed7ae4f43e228c Christian Marangi 2024-05-27  390  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
	Ansuel

