Return-Path: <linux-leds+bounces-3557-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 931759EAAF5
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 09:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC598188456E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 08:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EEE2309A7;
	Tue, 10 Dec 2024 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHNKmpLJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB012DD88;
	Tue, 10 Dec 2024 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733820438; cv=none; b=hiASm7FIlrLuMFqTprmguePVjDNs56QF6rJr7hWJ8KmntAVdEmH1dYVtcLLdZBwqjd1iKxZh9lZfcY/Vf/mlOH7HLKRv7mTdfxaSk3ExIyQ8N4VAfsluUCcduCdfcN9O3O1sgqRWBwN/6lY8J3KB6aOPnvkWtXsBOFwLuBh7pBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733820438; c=relaxed/simple;
	bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffdcr6OJVoe2zuzz2oyblfsqeYJliuiwaq01mbguVPOxRZ498N1qRUyx4FL3DYs3xDQ5AhvWzGhIoSeJ0FKs+VCgqgU9KJ3OfIiO1gp+ib+vIsoWQTOa3LD4LR+4OSLNfZAFIY8QAqWmVP3M6dwMLh0yXldJZIHU3rlAYvZa3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHNKmpLJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2162c0f6a39so23604585ad.0;
        Tue, 10 Dec 2024 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733820436; x=1734425236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=gHNKmpLJO7gva96UnxD7Ywn9UBYN67zJO5kd4oN+My5Qca2/W9BxLpRMcH0VLBMGCV
         T99qjbF4Ay+Ben5BZySzd8RT9ApAlyq7xsf36IXoDvAc+IAF3rE/YmB8A3/8bNl5716+
         n8pBnh6AOuMJWyB1pE3WOrtyAm6be5br9O+YA8rtLOYFdnqVMxXbcc5PDwsBGG3KDot5
         45s4wpgAWSX/1nwBEhF+yClBRrD1XWbUHQtsjbf1A5OLBO1Gofk+iOwPIJ9ioUX0sWGU
         5z3ziUgv+2hKTuEgEDfAbLIWvZvFojNNLE4RiW0IsOkRzPx1yDbPR/9iVTByLGOy7NMC
         wC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820436; x=1734425236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=MZhoVJMMMe7IxUxWcv/7uNZT8MKhrGMe1icauo/kfFmypmd2/Qj2w5/ojDoTIL60E7
         DuqGGa4zvMYMxuaetGaZPElRWSCb+ZrTj7aWwXe1xm7iAjq/jIWW8RkAgmTZeMxcIYBw
         sqbe8kJo8Xo1c4VskPtlJhxI2ewySBqUh0vYoZKyws1a40KlBDnmr4WLXH5R32bTDkEl
         vhTRRm9M8JAD7L+4n0HeYRvjZIzAksL1J+ojUnMb7KnNjjKXa2wZp4guj5OLg5U4oHd9
         5zXrKJ/qjwua0PAAP3MG+/OqS3SQ/si5eLjYVhfr9O53Z5q0KLPh5ICNPzgb58uW+g7h
         a0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPBkUHhmRSlqM9Kuil2hLjp4qr7sH5KqzvJfe/LN2Jc1F8QxOE9Aq3Bqtw3VEG/gegII+EfqmmSFx8XQ==@vger.kernel.org, AJvYcCWms3gtL4OpKV510o6uTigbSpWXncXb5O+AhQtogZVfGvkuyqtIJe49pAMzkEc4Fw1Gow6N6YeBImji@vger.kernel.org, AJvYcCWrx39WwV/D4KPYOdGpqrxDaG1wxETj6Q8zJs7q55D8XLSuA+/V9Hhn0ZqDd7xpf2X+X59x/hkR4Z6G7Lk=@vger.kernel.org, AJvYcCXMhx0N/jA++WP4gRuex5jDJy51//DOf4egTCnzYp6mfxI7c1UF0SE1lwjgcvHlE5cWMDjNyNCK1LEnPAMw@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAw8lZmkC8mYIrWhOZhiGNkwdUUk48zNS1ZairgCoa8KNzByS
	CaHDK/zI2LLx30Y6HTHTtzLOoFfEJkJ7wNrCry7NhpHXrhNTaTnu
X-Gm-Gg: ASbGnctng0nbTNJoQO4Z9palOmBbHH54tWmc5k9ZoZlNcHuw+3tvdcbuIRgcetD+gN5
	AUpIw3A/l8fmkL/AogdA2DWl3bqGgb81sJZmu61mGnDrXh5xGhWsrUAYG6OTi6KzuN/RjF9yxaE
	Sh1+u+ac/QPJOAlElKulWw5ZTMp19giBnvMS0ZPABX4Qrj5x5B+u2rzZBHmoLk2OlPdUwwHkDfG
	sBXs65vTHWJceno1czWycoe3tvM4uqgwNhp2YfdS8gz47vwjR78P8g5fh8Or85it0GVIhcLzVM5
	/A==
X-Google-Smtp-Source: AGHT+IFyFx9u2Q8EBc+BBmDXtC22UJjW0IxAAzdnx72zpqdewbRBPV5UQPIkvDpar7059Mt3H6VwCQ==
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id d9443c01a7336-21670a47b3dmr40495715ad.25.1733820435973;
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f26c6csm85230675ad.233.2024.12.10.00.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Message-ID: <23e6d9c0-c3d6-40c1-b933-01c5a9ef43f8@gmail.com>
Date: Tue, 10 Dec 2024 16:47:11 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
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
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
 <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/10 下午4:32 寫道:

> Nothing improved here.


This is sent before you left any review, v4 will have improvements

Nick Chan

