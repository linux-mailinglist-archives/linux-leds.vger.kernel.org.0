Return-Path: <linux-leds+bounces-7094-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDb9LDOrqGmfwQAAu9opvQ
	(envelope-from <linux-leds+bounces-7094-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 22:59:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D32083E1
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 22:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0370D3079657
	for <lists+linux-leds@lfdr.de>; Wed,  4 Mar 2026 21:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BEF3BED2A;
	Wed,  4 Mar 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm8EeYqI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37D8371CEA
	for <linux-leds@vger.kernel.org>; Wed,  4 Mar 2026 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661514; cv=none; b=HBNdZ880AjuvsFXBi80wDxaDKK+/f2KuT2ZsuOja1APFvjDP7m4a8ldQh1rLAPDKRPxwSxic4hoCoBTC9zN2nvo716AnUUI+oKKNGJqT6Gis6lcOCdKag0FMfJG6ZgNnB17uzmmecWcgWCpfLA5wjaxHoYbXA2it6nABAbTAqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661514; c=relaxed/simple;
	bh=MxjDq8gQjsyN+WxP0d70LaLi462jemmqdXxq11ouqCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNcsJrqZTUm6AeLYT7EWCuSNWHm4yWI++GCtiULeGysFuJo62cGulAmkkIhjbRS0fP3Y64KYL4EqTGxKdYhLMKequlQU3sVLADm23pW36/HlodbXOOZ4YWqwTaqyyx/xBv7+MGwGyrqBEZh5XxSJ/IvnNEgGf9MOVJqg73qLnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm8EeYqI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82985f42664so3633b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=Hm8EeYqIHgoVyAg19HsW8vi6Id2nSWPvijJG8p932wcI3tNAVy8PiylwwqXEFFYTXU
         zTw/7Lz+za+P8DisNBcMnI05NIyz3VKfglSJSPgnCMOMVajUwzxmvWGgTpQJpABz5Ggd
         mejQkZ7GRnNtShcXrlzpWxbTG5ymF4bfj9BDlorRw7FiTEsvlI0ZM9T3ZBOTv4UN9pkp
         vGkGyhmiV8mWSJUQeV0w0CU4BugYcZ1b42KuSDM5KG9ZFYgpDT1NlmvepiWjCY4P2TQA
         y0AMBQwZ/Qt7rsoP9XjDgMce7B04tzf6ejYB/YMgScvq7yc2sj9IBt8jPezcJLiZXA6k
         fzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=K2E3+VRMrBLeKTbsFdVHt4ba3qDZMva/D86zIuzxyKxYw/UdlNEZwJrGwkJ5Gn07j6
         b5tqCEFMe7XlzFXRqpqVLmw34scYHJkhj1HNjvmXusF/1YFfq9qbHvV+YZfC20MKc82o
         bjY8nUoEREOhlMFGbFW9GjLQnCUhty3uls6aFTzG/h0UDmuwpqqv0t+Z040ZZX2kQUoa
         qKX1IdjvZY1xcivpem7pvvjNP7Eca9ftdbIdU90AKpYIE+ujDnwYwB2IF4i30fA/3ioj
         J8I34k9+u9HxamR7uRmg5DKhdGZdeA0IZPnn5Eovou78Hs8TEkM8UNTvrba29742HZqB
         T5AA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLxwJRa6IYrZD0jt5hmqryueHPx49tz8IazKQSB8JU3w97Pw+w+tyNEaGuYu+03htEvXO79xio8CN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5v3ViVJuR+6vPuG7zBDXG1PwxfBkIQRuLd6g/mRk32qSfVL9e
	HZPsIdLvVTH8pCJcBLDqyB8W+JXi6SPmlbFa021MGREMg3E0CKb0NQn8
X-Gm-Gg: ATEYQzykqowY8Dx7Z1Y9x51pYs/Cj8sQunNPfDFOw2OdKML+1pUioRhUnzEPVJSzCwb
	C5LuIOC9teL6Ph4ZkqlCalgqTRCBITRb8GApJgwWtS9VDN0mGznuBmahAX78yO6JSqIFAeJz85Q
	eTvje8ka/90Zt0A8XTPE1Xf2PMOD4zEf6Q7TWDqK23zU88Flfl+0Df8g1UJS7gPI8/ucw9z4eq6
	MPT5P7WUGC1VUzyTagevGCQDs+IaHFWQ2YUb7d1O98pCWIekj24H28NxNlf1Rt+l/BAw3Qlf7Gr
	nDSwb1gnyVc3AZGfVFm37AiclVWP5il7KRSBst+gKCpZPsx8UV4N3YVZUgRmmUn7aFw1d9QAdH/
	MKAVdNxxzig0cg5kNwzosfj+3XQrq4y4oZwOXbgw4JoWRkERySkTQ19rlGU1Jch12arxqY0w1d0
	TYynVZrSSnMKboNlZgWUPm0V8Xbw1wcsQYXkom
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:58:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
X-Rspamd-Queue-Id: 637D32083E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7094-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,linux-watchdog.org,linuxfoundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

