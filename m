Return-Path: <linux-leds+bounces-6140-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47182C5D599
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 14:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE7354E2935
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 13:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01579314D02;
	Fri, 14 Nov 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLxJBecV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366E314A6B
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126525; cv=none; b=omWZ08QmaMJumwesGG2Hp4mPbuDn2PZQGqvF2KzSIivPxJBNZob/8tsqEg0po7rE2jG00G3UAXnwa4nitrkEBbOXuMizxc9rigBWprV4GSRRqyDmpK6kyCwgN0KaqXbQv5oMKPDjEuDrPsUDfnCA0HDZdp3pxxCUa3zmIhmCn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126525; c=relaxed/simple;
	bh=PIhVxornY+xeHydrfUvm8sKztzt4GgYtkzvZxgJ8W40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwW+FBZb0F5iEJOfq+uMlmS3+8gTaxylt3c+k3KI4t9Qux+q1vf+UbEDLWvMD7ESVc3n7ed+asp36yEz1K1xRoaBvbcehAWX0Bd4wtIkrk28Id0n42gjR0O72Izs/5coyijfD/7wG+YabLOqf4qPiGdwuxRzaGd8v8JPYjo1Tqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLxJBecV; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37bac34346dso5637411fa.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126522; x=1763731322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrtX8x6xiGPlcF3REo6XTaulSDVNKE90sjqlhnGudPU=;
        b=JLxJBecVTt7ci4MySHtaJCX2RuSWm+47+kgQXd3+q5iCTC6xRsKVeS4VMO2C6iKoUi
         7wC7myl8516ZyD8NfP4qhC6InalfcMWDXVAnbtLDFNwJ6ARwpQfEZIrsLX12cgIT1uql
         lrk6TGIK/1QEbP5uaOpQ8lOu/DJZfSzIb3aiGlYvsoBl6Z+b0tkjB3xpz6kbj1SreGpl
         da9piGtvNIXkCcYmoDu2sNWR9609OQO1ta0KvjdQNYb4U1AiIS2D9tvNsn+Wv5udjE9n
         tKW1+Vcx+V8JDmWgyb2Y2iuVQPq4hnOZ7a48Uw3v7Cx5fOHYIAEu4dBdezJxsOSPM0Es
         tZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126522; x=1763731322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrtX8x6xiGPlcF3REo6XTaulSDVNKE90sjqlhnGudPU=;
        b=RyIxbi2u8VxHGYrgqkFxdHMvQ3sElZ3lRBtV3e8iYlN1JiyENNqYOhO2nAZGqsR4LI
         i4JPxT4zWRsE+Q3bbsbL4cMOPBsqjXkfNA9v1W4zEaP2NROIwhFICOjAvIiEH2qxdySl
         P//q74QuK1WsSGJjlA8AFDQVcRunmdFwPZB+w2wdMfAUS7pGYUcBh0oVdaw7eYGs/2uI
         4xak/Vdc0gRo4aE2YWptfkch1SDHN68wIZLjWYl5yio5GA8KB4dwFZcfR0KJ8RtX2qOG
         ttlknJ+bh1OnwU91D9nc6cefOl8VmS8oqeuzl5dyNbzmgvwTzGHMh5tNN3PllLl80SX4
         KTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgYJwiRq+ltY3uA3EhLiOPlYDhQdyP896GQ9xoHDQiApWX86xGU16fGrsHnZWvO6ld+NY0w8A37Xse@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Ad2BkMp0+qJcvihf4G7AAwpcBysNXq60i8W6LmMsS2z6MdUq
	fXbJDejCTQ3GTGqc7Ody2NTOsTeW1gbxLGFlHmMneqf790jybYHpt27w
X-Gm-Gg: ASbGncvR/P9UoXpcg1uOLU3qZ8bc8oUzCOSOA4gQOPWBJINjdwz3HEAwpZEwflW+gXl
	39NYEO5Yt6d8P2EohDKBjfQzR91AIRx5oL9SfwbtpmLhaQOxcV2Fh+e8lCcEsLq+gT6KxL68/3h
	G+xHgbIXRmoGu+We+si9k+2Ael9aUK4OFPqeuIHVLndyAuZ716WbS0wrAn5Z9aEVHGZMBwHKe7H
	KJGlVVqARcQU4tszf0kDUSoLk+lWcA3yB+7jNNwAnnXXYTmUrD4oZ7OVdEyPBeAvTnvRR0ClGNJ
	i+H74nD2tlC7jOcoXcrZ2v9qGTxFbdacdf7lYnG/DCQtIXa130abJMRDtRRKw4Gytcv4XF45tdu
	QZhXTjbjjIWD1Im7ZPY2OYNmYgpDmcqeRPyccZ2zRTJcKNYc8xP/XIUfNg9hsfC4TfUul8+lx5J
	WumkDaqh9bLm3kNy3yMudksq1kPtpBUsjqCujYvP1OToIpKDWzgabPiquzKQ==
X-Google-Smtp-Source: AGHT+IFJvPwRc3iSb2WexT7/Nxb76MqMei5zXQUBPxVbaOVwZ0mTUJAzGoCKPRFSwFTVf5iDU0WZyw==
X-Received: by 2002:a05:651c:418f:b0:378:e3f9:2d26 with SMTP id 38308e7fff4ca-37babd80ac1mr5793261fa.39.1763126521767;
        Fri, 14 Nov 2025 05:22:01 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080a6sm10220141fa.4.2025.11.14.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:22:01 -0800 (PST)
Message-ID: <2334e57c-a384-4a1e-9708-19d14b8f082c@gmail.com>
Date: Fri, 14 Nov 2025 15:22:00 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] power: supply: bd71828: Support wider register
 addresses
To: Andreas Kemnade <andreas@kemnade.info>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1763022807.git.mazziesaccount@gmail.com>
 <6248200397d3582fe926938736da66d6bbf9535d.1763022807.git.mazziesaccount@gmail.com>
 <20251114121509.629d171b@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251114121509.629d171b@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Andreas,

On 14/11/2025 13:15, Andreas Kemnade wrote:
> On Thu, 13 Nov 2025 10:55:39 +0200
> Matti Vaittinen <matti.vaittinen@linux.dev> wrote:
> 
>> As a side note, we can reduce the "wasted space / member / instance" from
>> 3 bytes to 1 byte, by using u16 instead of the unsigned int if needed. I
>> rather use unsigned int to be initially prepared for devices with 32 bit
>> registers if there is no need to count bytes.
> 
> Well, this is totally internal to the module, so no ABI/API changes, so
> there is no advantage of using 32bit now I think. We can switch any time.

The only advantage is to avoid the churn if 32bit ICs are to be added.

> But we have 32bit stuff in the regmap cache anyways, so that is not above
> the general level of wasting space.

Exactly. And, I am not sure if sparing ~hundred bytes is worth the 
hassle - even if it is hassle internal to the driver. But yeah, we can 
squeeze a few bytes if it is seen beneficial. That's why I mentioned it 
here :)

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

