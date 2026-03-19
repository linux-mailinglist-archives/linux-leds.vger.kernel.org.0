Return-Path: <linux-leds+bounces-7401-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEcrJEEfvGnQswIAu9opvQ
	(envelope-from <linux-leds+bounces-7401-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 17:07:29 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 910382CE5F4
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 17:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A3CD3096FB7
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 15:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99BE3C1408;
	Thu, 19 Mar 2026 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VInaZvZI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B953E929B
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935609; cv=none; b=hHYj7HFhDn2beANn2wSAbPl13ZHD8sKHEiapP8nH4T5ruvc2k4oDQzDN0+LBeVCzAsatYn20KqDMfmM8pZUCN+8LAABbodRnKTzswYN5ApRpYPAOntS4EM2259+YkmCT+b3p4+60bNSXbEQSjOAn6CqaF61Q9odTv0qF1TzCgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935609; c=relaxed/simple;
	bh=5bYAbTkUVnEEFoCcR512hDmK7U1WNVjiltP2U7iH2cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l4kh3IhrY6T+MNfhHsoT8WaOUDo0sTJHKhphzQ5x4i+CibdssvCwzxXVtPc79XUWKa6mV6zg1FnlEPvFxyetoUwfhS1tNoeoLrCsr9mkmc4VdPLMEQZT76/7lYw1bELGhOt8kGXhc4xOv/2S5KOEZL4ac79y6v0DWUaca2Q3gik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VInaZvZI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48541edecf9so12221905e9.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935606; x=1774540406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIWRiNAZ2M6LL+C7o8xZgnQ+3xY+inOKefwQYaGNdVk=;
        b=VInaZvZINV9QxQyDyy+Klkl7FBs6UW7WYTioD3go8b9GISvWlaScBNwObAFtQZoTgp
         UnKkggbINuJBnE9Fmqgt9Qu3oFMA6BwCINnt/cFzD0o6WwXu0ZtTX9sK+R7+DzZQwfre
         7v6KB7vTAE/9W9iTlCSMM58VQVtYKfhA8yo8o10FlLHVvwe5Tuej29whNJaH1j3fL2Qe
         OWx1HVJFx0vY9q+NQHU4ypi3PwpgXh6F9WyPp1oWY6VSEHA6jQqTXjvIwpLo+3aT5kXH
         c6xaOUqW/HVAUJNE+OLEmak8/IEXOpvcw8+d8lnOv96BqBYYLHJi9PfLlu5xO8Cs2rvu
         frOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935606; x=1774540406;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIWRiNAZ2M6LL+C7o8xZgnQ+3xY+inOKefwQYaGNdVk=;
        b=l0tzwsezchG9YMlnBBQYuSeBFrNzCNmTRGNlzpTb3rGZr/pnlmuWFXgn/jorY2BY9X
         N4aANrASoFOPtLOlO9FaD+y3HFk+QwR6updBXrTOqLrm6SdR9ZU9m0hNTBS+sjNERwMC
         PCzNlt1YmMMiQpVVQ7eAhtrhHl36ji+b9JIdQAE7x4zyrbtahTfB7PYFvn+E2HQY5Ssq
         ZlHv0dp/VTm/18wLmj+mccaWoIvR4LCe/NEwb36M3O3/U2fNbFTjj6IscaZmZ6fHhacz
         7MDMXQE7vfhUsxz0V3cQcoiuGBQwbujklKyDbK3Lbe72KpJ/qKwwRhfvPEDzljqm0+h3
         vi9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhPUlr1vHwSk7PBv8uk7WrJUpqrbzzBa+mW+81NrWnzeN0dzUhj6a1KXXQjSOmpoJY7P5QPUWec//Q@vger.kernel.org
X-Gm-Message-State: AOJu0YziVXkWW/sU/Unlci+Af6C7I1gKNZc3345dEhjMiwPqMaisBzGD
	CMcynnTJ1QqXTYxPrQjPBYsJGFef+Tqy6F/WwgMULUmG6RErrmfHaCK2A7meBKplypOgLVEOiE0
	p/y7t
X-Gm-Gg: ATEYQzyDbh+oT8W9thlbd6VH0HyROoWukGqqOCqROKxR+zL0KOfqftFKaU7BiKdvvw0
	3UARyep/CWm1xKb61ZWwsKNYVw7XqEj5+VUXAJnQ9TxscRzbJCmmt+h8HsfE5p3dDw8L8BblD9O
	jmK+HhiQjLL7Roq7oAoKcoDT4nM9UYGx63fTvdUYJmPO661nCqZFrgEWV0OLJSu4vn0k9A58MZB
	pzbvzpnjbWbNMh/LjosSCt7uXVIN/C/u74tH58aDHQJlrFXAhVDMdK/dz/RJqBq9msW7dXCNQAF
	ml0vNqJTq0MlWvmHtq4hEazt8HOuzUMH+1IZYGvgicQy9bvGpy6H4nQGl3oymH6imoPXDwR+9w+
	boWfZA47If3nJ4ySmHws9bXP4Xi6qoyt0CGAvuq5zYvBOUeja5dQLay1nX5esrBVpo7TT/otspY
	fOf7WK27mbDjFPlZxE/nANoFp/qOZX
X-Received: by 2002:a05:600c:3b28:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486f441bc51mr130418635e9.7.1773935605472;
        Thu, 19 Mar 2026 08:53:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm128484205e9.9.2026.03.19.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:53:24 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:53:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Jan Carlo Roleda <jancarlo.roleda@analog.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: Re: [PATCH 2/3] leds: ltc3208: add driver
Message-ID: <202603192312.QLMHYKWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-upstream-ltc3208-v1-2-015f1f1e9065@analog.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7401-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 910382CE5F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Carlo-Roleda/Add-Maintainers-to-LTC3208-LED-Driver/20260319-005902
base:   e68f95a51d1a8c1594b536c4d495cbea38d47561
patch link:    https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-2-015f1f1e9065%40analog.com
patch subject: [PATCH 2/3] leds: ltc3208: add driver
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192312.QLMHYKWa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603192312.QLMHYKWa-lkp@intel.com/

New smatch warnings:
drivers/leds/leds-ltc3208.c:222 ltc3208_probe() error: buffer overflow 'ltc3208_dt_aux_channels' 4 <= 4
drivers/leds/leds-ltc3208.c:227 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

Old smatch warnings:
drivers/leds/leds-ltc3208.c:229 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

vim +/ltc3208_dt_aux_channels +222 drivers/leds/leds-ltc3208.c

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  176  static int ltc3208_probe(struct i2c_client *client)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  177  {
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  178  	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  179  	struct ltc3208_dev *data;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  180  	struct ltc3208_led *leds;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  181  	struct regmap *map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  182  	int ret, i;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  183  	u32 val;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  184  	bool dropdis_rgb_aux4;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  185  	bool dis_camhl;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  186  	bool en_rgbs;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  187  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  188  	map = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  189  	if (IS_ERR(map))
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  190  		return dev_err_probe(&client->dev, PTR_ERR(map),
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  191  				     "Failed to initialize regmap\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  192  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  193  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  194  	if (!data)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  195  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  196  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  197  	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  198  			    sizeof(struct ltc3208_led), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  199  	if (!leds)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  200  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  201  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  202  	data->client = client;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  203  	data->map = map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  204  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  205  	/* initialize options from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  206  	dis_camhl = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  207  					      "adi,disable-camhl-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  208  	en_rgbs = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  209  					    "adi,cfg-enrgbs-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  210  	dropdis_rgb_aux4 = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  211  						     "adi,disable-rgb-aux4-dropout");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  212  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  213  	ret = ltc3208_update_options(data, en_rgbs, dis_camhl,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  214  				     dropdis_rgb_aux4);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  215  	if (ret)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  216  		return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  217  				     "error writing to options register\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  218  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  219  	/* initialize aux channel configurations from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  220  	for (i = 0; i <= LTC3208_NUM_AUX_LEDS; i++) {
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
Should this be < LTC3208_NUM_AUX_LEDS instead of <=?

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  221  		ret = device_property_match_property_string(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @222  							    ltc3208_dt_aux_channels[i],
                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
Out of bounds.

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  223  							    ltc3208_aux_opt,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  224  							    LTC3208_NUM_AUX_OPT);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  225  		/* use default value if absent in devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  226  		if (ret == -EINVAL)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @227  			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  228  		else if (ret >= 0)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  229  			aux_channels[i] = ret;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  230  		else
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  231  			return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  232  					     "Failed getting aux-channel.\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  233  	}
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  234  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  235  	ret = ltc3208_update_aux_dac(data, aux_channels[0], aux_channels[1],

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


