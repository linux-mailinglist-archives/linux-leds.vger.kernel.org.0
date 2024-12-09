Return-Path: <linux-leds+bounces-3535-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 587479E91C7
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 12:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5162618872B6
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F49221D9F;
	Mon,  9 Dec 2024 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKm6K7vZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD7221D8E;
	Mon,  9 Dec 2024 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742463; cv=none; b=isg3oQPOfxR4KF8mkdpPS3pbcnXFzB06RMrOy6GTtplkwY0CfnAEd6jmwzPQm7ELpu9wLHmxZHRBfBZcAYrqIEjRs7MpMeD7yUuYWw3wavLQ0B8iwImofehLTQWX2ateQ718tYvr/HeFcezEkjUs7p+ntSqJQWABHQjlbY7rP9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742463; c=relaxed/simple;
	bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBjwBoTsDUaABC9OWQLxHkb9JoBIYMKZ0SUf8vYa1NJLkB6JrF4Nl8+/iX7pHlEHPGmJYDkeS0a+mnJkBCR0hdLUJS9wvcBGNWSNdWM7wAky0U7zE6eBYFEzDWR/vuez+wiDyOS5PWGQy4IlSUjtKA6wTHpvhnaoPUkqeomPuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKm6K7vZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163b0c09afso10975235ad.0;
        Mon, 09 Dec 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733742461; x=1734347261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=TKm6K7vZe6L005HfUAyb/sNtDIDRwORDdEUj6xWxu2PY5JbnoTmfRkwEOZQ8J63w4t
         EOt1rZwJLyB/rg3oNdKpo8raCFgeVndrB6Ln+qPPaHer0a5NFQ44gUoieL8lVExVrlcy
         0cm3JXd2wnR24S4lDAjw4Jw/IMmbYTPZLOhQIWo1rz7SNDFmFWjB/FWbX0kFny8m9kqG
         BCbuttCSpo2wD/OtbllgU31sWdjtSG236Duzk/78WUqfiLBuZAznNWkpfbc6G6yTgKve
         oZcqK969RtjCl1T2VtfzFfUU3mcV1wbUOvvO9HkfUG9nfwtZBuC+1/fUwQesefIa5bgj
         KQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742461; x=1734347261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=O4JTPUnNvZTDht/hcDnWJCdMo5YR/ERU/NhbbglFhwKJZo/nY/qtv5gzEFAkpmwGYy
         sHitmbW/d+UXOEsghUsTwC3wqTeWT0T6AAFWIq8hKeiRWU8gcIPRi+j4jidFDAP5MqKW
         RhzkD7NAeyHyqYUVOfMRzAgXcL8Qyji8u4AaBPLU5USH0ur/rwkO7/4+xZHflE/XITfn
         PcPaEnwlU/03n/JPQOGbBG5r7X831+xg6EYDPnT/kBfAYuwBix/4pcopso/qXD9AUmJ4
         64jVJsjvMgEnEtMwEcAwlkAioPSXMHM3FByywVYGdihbdCIrwlmKDestlxMVsC//PJdT
         d1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVKLAIcwFoRIyjzE5FI8Q1wFKwMwxqCYjcC4n2If9TjnZ8g34nl/j0fajKXqSbpDPu8mgTrKqPrWFCScg==@vger.kernel.org, AJvYcCW+ZQuDPLl5i3fWZd10+odnTHv7AYl0ZGVQkzxbl2wYwlKLzWPfwoerj4Hz9ScpNwd8tUF+mobgcd++xFXJ@vger.kernel.org, AJvYcCW+pBt9+pQzlqqWkZJgl0HfGL5HCboYnq671s2WF0Uu3X7LW7URn+QolVwnnAMbWunTrBQObZ7IXKzE@vger.kernel.org, AJvYcCWy0dv3wUSnWWmttgs38ceXIjWWiuihDPLYNzgyT+aTfjbU6W8bBmyFoKevkbB4uO1Xwwafv59+XQxSUK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBOpRvca86oDVgQnVbkWYb27vPWdQJjDlq2kZeLsPSD5H+zPd
	MGExuoYuz0ocNdlPK9euGKikuaEazjRL3XHZzurIoJWNTaqVf6Hr
X-Gm-Gg: ASbGnct8hPCSYRQh/1zCHi6y3MN/Im1JMR7aSUV2ZR8Y9uU7U3SBfoZVI5QCL1uYzwq
	7mzfDJ7t/ZD3zYBDqFyzvXu67reGtnsQa3blZIpaziAVE3x31gLE+RplZ9q3ZNlYO5/xKOTtGjY
	lqsjpr2OJJflv4arMIqUO0dIFsixHjlw9TGTwRGSPLf4pySBc7NwcZaKlAjs376Dn5XynUkyZ27
	UIisKOtFyteAGdfl4g95dVtI3DtgurKyz5raT3ozfTQAq0akGnJLNLFnA==
X-Google-Smtp-Source: AGHT+IHE+t2Du1WqC/+jnVLPWSG0jQUPMDd8/py9w7+kgKS309UwwhMmDAhAU/gz6Yfj4oBXSzHyqA==
X-Received: by 2002:a17:902:f607:b0:216:4883:fb43 with SMTP id d9443c01a7336-216488401a3mr47732355ad.32.1733742460654;
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f3188fsm70017745ad.265.2024.12.09.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Message-ID: <494a944e-4088-463a-abbb-c0a8cf4455ec@gmail.com>
Date: Mon, 9 Dec 2024 19:07:35 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-2-towinchenmi@gmail.com>
 <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/2024 17:16, Krzysztof Kozlowski wrote:
> On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
>> Add the device tree bindings for backlight controllers attached via Apple
>> DWI 2-wire interface.
[...]

Ack all the changes, will be in v4.

Nick Chan

