Return-Path: <linux-leds+bounces-4353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5861A6C80D
	for <lists+linux-leds@lfdr.de>; Sat, 22 Mar 2025 08:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0B33B565E
	for <lists+linux-leds@lfdr.de>; Sat, 22 Mar 2025 07:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B83D13AA20;
	Sat, 22 Mar 2025 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVek8fET"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BA155326
	for <linux-leds@vger.kernel.org>; Sat, 22 Mar 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742628618; cv=none; b=gJoy9/38LG+9+bgiPwcETT8hGSWzGoqTehVxQEozYosyj6bXBhlHAV9d9JVqVSwLlCgpisuAn1NrWDiXS1ff67sBZQ/woci2DLm7YmWeiPcJfeK1sSGX5ZOWyjvQsve/kM/gv12+RwHWQUrCUPqZEhcbv3vkmkXb/TjPv4RdcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742628618; c=relaxed/simple;
	bh=92RQh55jsrGFROKnG6xoihCWbNixqwF+HTtLMlW0uWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RwQsA1gTTrpBEbHzhusA2v82FRoPMrxhhmRWIHW1nkWQeMg4RIY8tZWioFmzsNPA6OZLtGfqcXzNVZaTdxaqoxTGzQIuDGTz2Et3MTP5jYw6Xh7bRz5zKDajGBCAXgMQXV4cJMzUXZsYXV0/97WSL6DBARVik9XZLItGHWlynu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVek8fET; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so12911775e9.1
        for <linux-leds@vger.kernel.org>; Sat, 22 Mar 2025 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742628614; x=1743233414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMKeYU6q3OdefJ5qoJnBTsWhUmldL9PQbm5T/LBiBo8=;
        b=wVek8fETwy0v/S34nn94wUXX4Y4VZypUzu1ocmA+98Ejb94snL4JQja4wS0/JJygG2
         p7zok+0n3+lb74tjepCHM62vBEeTyTu0ucGzwzXLqfQSQOOwH7AVyPJBqMDZ+jM21Rl2
         RglFxuhchPMSsBDYtx3t1mhKYnTmv1kl97HnX1K4uNdE2J9gZinC8fLyAcOc+eSf71fN
         vnRQ3rUtUw6MKmfjv7v0qtRPnEivPxoajOP74s3WvcupsSMWZMgncBH7IEKvBhypBBA5
         CDVpNMPFCSP/7ANHEkWpGyIhXaxZPh2gv+zhlI7l4H9A446Z81+7+6+BjMXc3pLJenB4
         z0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742628614; x=1743233414;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMKeYU6q3OdefJ5qoJnBTsWhUmldL9PQbm5T/LBiBo8=;
        b=t11/dSKgwXSRUTbxwW4dHX7sq2zKNADBebYxYeuw0KOjThhjr4W6fmQ2HRQQTj5Z1z
         7fhZtJn+HHAAjNNhZpW5IxMJxfcV/imqhPRv3SHtVwT1bBEag/ZWhBSt8nWSnKyIuzFB
         Ofe4rr8goNx4GpbZKnP27X5XELsmt9RFLFJLsttspdYtHCbHNEQeZ42I8mOuXh9DPbZd
         u0h2iiQTDePl4qvPi79ZxsgLb99yrCZ/vV9y3Xu3St1AC/sQRbLotcTkdQWbHh+GYL+K
         IEisK47783Eoo2i3VP3suxykc3oSff9E2yV7khQraUAoeutIsoirR+aBSdKlC8zb1czD
         /J1A==
X-Forwarded-Encrypted: i=1; AJvYcCXhGrKxLOnwD19PCEf+IPrsHNg1sC5jQQptW6U3whAZqtW7jx3/FNkHaqPbygDA8t3Wp8TUnCY7dbrd@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkSBqC9jyZ4fI15Hvj4gt+Yp2dCzbdzlOG27L4zVLc6sJJgky
	SsWXxrgtOj8ficW6oX+IK/ERPomqUpiWWzT+VQkQkHojz6WXQ5RoPwRXmNlQtXo=
X-Gm-Gg: ASbGncviu3brJg/fwPHKDApce/4YE1qdeLqgFDW/1AEnol9rpmZHSiy8VlDHf2Cn9Dp
	UgCHvsaMDtKplilXf/qs77XEb85XTEcQv8XuCcv71OAu4gCTFG4bk5SCM8voIwQd9YRIkySlrbC
	XCyHtjRTvElqik+eVxhdl0DgHYCKnaGWzgZFpnrndH4L3Mq4vlNh1K3GyqdYO4czIf8rXiILLYf
	ymqbwpg10B/UIsTAbLXO5x9n8bdr8yJyDnkpYapeSh5/04x5R4P7A24QbDxrdbcqRGdZSOYH8aZ
	vrWEb5PQxQ9KaZeoaUVj/qUy3q29m1ViMv7WUZ9mBgTh9/3CYQ==
X-Google-Smtp-Source: AGHT+IG7qXonJx7QL3b5p+TPntVrGtmStjhpGd7w6D7GZ0R8PBo0Dj1oOcNu9xVsk8AEIq0wbiW2bg==
X-Received: by 2002:a05:600c:1548:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43d509f73admr57076085e9.14.1742628614427;
        Sat, 22 Mar 2025 00:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e6767sm4506984f8f.66.2025.03.22.00.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 00:30:14 -0700 (PDT)
Date: Sat, 22 Mar 2025 10:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthias Fend <matthias.fend@emfend.at>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Fend <matthias.fend@emfend.at>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <87955568-f73b-4df1-bc94-9acb4c337c0e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>

Hi Matthias,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/dt-bindings-leds-add-Texas-Instruments-TPS6131x-flash-LED-driver/20250318-154318
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250318-leds-tps6131x-v2-2-bc09c7a50b2e%40emfend.at
patch subject: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503221153.G9HPVANn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503221153.G9HPVANn-lkp@intel.com/

smatch warnings:
drivers/leds/flash/leds-tps6131x.c:534 tps6131x_parse_node() warn: 'num_channels' unsigned <= 0

vim +/num_channels +534 drivers/leds/flash/leds-tps6131x.c

02e7ee00455be1 Matthias Fend 2025-03-18  512  static int tps6131x_parse_node(struct tps6131x *tps6131x)
02e7ee00455be1 Matthias Fend 2025-03-18  513  {
02e7ee00455be1 Matthias Fend 2025-03-18  514  	const struct tps6131x_timer_config *timer_config;
02e7ee00455be1 Matthias Fend 2025-03-18  515  	struct device *dev = tps6131x->dev;
02e7ee00455be1 Matthias Fend 2025-03-18  516  	u32 channels[TPS6131X_MAX_CHANNELS];
02e7ee00455be1 Matthias Fend 2025-03-18  517  	u32 current_step_multiplier;
02e7ee00455be1 Matthias Fend 2025-03-18  518  	u32 current_ua;
02e7ee00455be1 Matthias Fend 2025-03-18  519  	u32 max_current_flash_ma, max_current_torch_ma;
02e7ee00455be1 Matthias Fend 2025-03-18  520  	u32 num_channels;
02e7ee00455be1 Matthias Fend 2025-03-18  521  	u32 timeout_us;
02e7ee00455be1 Matthias Fend 2025-03-18  522  	int i;
02e7ee00455be1 Matthias Fend 2025-03-18  523  	int ret;
02e7ee00455be1 Matthias Fend 2025-03-18  524  
02e7ee00455be1 Matthias Fend 2025-03-18  525  	tps6131x->valley_current_limit = device_property_read_bool(dev, "ti,valley-current-limit");
02e7ee00455be1 Matthias Fend 2025-03-18  526  
02e7ee00455be1 Matthias Fend 2025-03-18  527  	tps6131x->led_node = fwnode_get_next_available_child_node(dev->fwnode, NULL);
02e7ee00455be1 Matthias Fend 2025-03-18  528  	if (!tps6131x->led_node) {
02e7ee00455be1 Matthias Fend 2025-03-18  529  		dev_err(dev, "Missing LED node\n");
02e7ee00455be1 Matthias Fend 2025-03-18  530  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  531  	}
02e7ee00455be1 Matthias Fend 2025-03-18  532  
02e7ee00455be1 Matthias Fend 2025-03-18  533  	num_channels = fwnode_property_count_u32(tps6131x->led_node, "led-sources");
02e7ee00455be1 Matthias Fend 2025-03-18 @534  	if (num_channels <= 0) {

num_channels needs to be signed.

02e7ee00455be1 Matthias Fend 2025-03-18  535  		dev_err(dev, "Failed to read led-sources property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  536  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  537  	}
02e7ee00455be1 Matthias Fend 2025-03-18  538  
02e7ee00455be1 Matthias Fend 2025-03-18  539  	if (num_channels > TPS6131X_MAX_CHANNELS) {
02e7ee00455be1 Matthias Fend 2025-03-18  540  		dev_err(dev, "led-sources count %u exceeds maximum channel count %u\n",
02e7ee00455be1 Matthias Fend 2025-03-18  541  			num_channels, TPS6131X_MAX_CHANNELS);
02e7ee00455be1 Matthias Fend 2025-03-18  542  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  543  	}
02e7ee00455be1 Matthias Fend 2025-03-18  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


