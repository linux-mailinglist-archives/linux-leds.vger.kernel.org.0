Return-Path: <linux-leds+bounces-5316-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B1B35277
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 06:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 059287A2A62
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 04:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9056923507B;
	Tue, 26 Aug 2025 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzM/8HwL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CD3D984;
	Tue, 26 Aug 2025 04:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756181068; cv=none; b=oJWhUV1NKMF+cF7xY6nOxAfBhUZbny8c13lnmzVA79BJu50gA0JB/tGzbp38MkShfUrCODIQlJgPNAgD8Qd8GETqSc5ejpLQrfm15sQQ11xKyAdY49CQqA4g/RzhGRvgXxvlfzz6CAPYId7KjfGFncMo9cnxswoeKlThMlkreYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756181068; c=relaxed/simple;
	bh=QX4wEww9pCxHTxsGEF4cX9KVwza5+WczsesrfODaono=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=chP6nrvYkfhfg1/lcRjsWQuLS6EPSj0NgktuO0vIXA5s3rIPhF/UjFXJXz1GNAbTMmUT+tHKJDTKPukf/C/jnCO6WimE41aRPxxGf1k+ET4YmQKrx5uEr/M9gD1khxnNYZhXxR9vLBSM3Z0YilsZ88EqgJwzvAvgToIg3jvRv/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzM/8HwL; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e87068760bso558906685a.3;
        Mon, 25 Aug 2025 21:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756181066; x=1756785866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZS8NQFSL7DR515j0Sn4SCmSwIfVSg5w6wgOrN140yU=;
        b=XzM/8HwLkX1QcESdg1KWa131g7027Qn/QQwCw0ppyZEnqtCZMGNHdOgWhlViYgioi9
         /f2shAoNHj+gzjcAy8wBzJaRZqFUDv1kCXA8eVziXHv1EgDWcfwXP4biYza85P5hpHds
         KMVjjJpwmcAFUbs9ivtbwmLLzHvXbflsAEbT2lF820TH9fZwGg/8lvuiNAvA6Fcs43j1
         oIwgBsSj2kZ1Jju9MFJzTpSeWjbCYVFPe2NuZIpXts6vPba+QGrgM5GVnAVZ6IcwXu2F
         RQI0iFIEF6JsvNb5KODc3blC/RqCz8WE8L+WGX1Jue/7X4HTLJ555Fh5RpCLh7Z4/D0L
         svJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756181066; x=1756785866;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZS8NQFSL7DR515j0Sn4SCmSwIfVSg5w6wgOrN140yU=;
        b=dRwqywPmAXP2k5xjnUmkKhxlPR0QdbDcA54iP5FAQpOFvB4mzYA5jSz9WB3zmd4JMA
         46nCXxyUKQjNOvivAKse8d2ZFSEaSINu9Brbb19XvxYM+6ZuoAp5oxn+HwFAtrREZ9ID
         bnM2hqaryoZPKv2f5SXJxYE0ZeFHms2vC1xI0xWcZ8i6Csed19VPqxvk5Gyt46+98S0F
         uS5ldJL0+MC93oW1AS/MMbqXLMP8xICX8okxoyVAUxCWPS9wTPTCoSwtwyetWrL0bVj4
         xSBk0gmxy3CprNz6XiJax9Q1050Ecb1o8cRoshE8RZgfVb3X1pH1TymfSR121mzXPA+C
         JH5g==
X-Forwarded-Encrypted: i=1; AJvYcCUp7x4FTSRhcyEC1QOEypXqf07YLS9x9B5hxEyN2uZFh4tVvrQK/9YaN+jdFwNJUkbs/YyI7hBt189R@vger.kernel.org, AJvYcCVlClKuOHrLREmpn5z2Ni7qhMZ84Zl6O2Z5ANRyHdp0X/Ps0dOIsHEDEIfmLfaQRiaD6Xh/dsvOGqCM6Q==@vger.kernel.org, AJvYcCWemzHUUAnQicGe9A0q/hOn5VMJki61DEAWP+8fFGxfs3PSoyDRHMjw29PxC+p6M8VcWmwnmxsaoPLEGVDC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/dqjnbFYBHuLqDVcDBIm9xIu4GragXrayXMqAwPahjElv7jEq
	9udf9dVdZtjrCOeT19SNIFvOvHqnf+wSFfX6sI6wG2rmd3MB0r/AaOmW
X-Gm-Gg: ASbGnctw9bHedsutRmavlGfWz5SysxP1wc6R9PqF3M2WQrHiutVAqpPnTPr84i8GKbN
	o3x/QJDQKBxMp0rq6gsWkehBjglt6+pMJmjGIdmMtKkkKI0r0Oj2S/j36EGdK3xPuvemTnhIbH5
	rov75neSrxLybBB1xvikJRfJ/j/cCR4KZyHQR3VIS2FKtIn2lH8pGEr/f+1UFxQeT2N2J90TwBA
	urueUCB6ac0HL91e7Eg4aJMOMx6CLxcYNW8wQBxfo2QvXnbGFLxGOcaSeo9GssZfV0Sj7B+QCwz
	7wYeoR+CrC9yBkbAGxIV4fa7t4zMvcp6lX6k4ilg7IzHyvXgsumAtshuIauoEt0gstHhI4hRXHZ
	J3dua8mhstFxItinxNbFL8k690zoCsZSqEOOBB0f5h5iG5qfI+mvClZUI/ChQPDxF7POBRVP1DH
	t7S2fa
X-Google-Smtp-Source: AGHT+IH2SSfDB4Q2waex8Aus1LEdieEpNTqqcPRdKf0uR1xlUQydrt++uCeAkL2S5XxFS9ziY/ydYw==
X-Received: by 2002:a05:620a:1a23:b0:7f2:2982:1eaf with SMTP id af79cd13be357-7f229822d16mr435119685a.74.1756181065722;
        Mon, 25 Aug 2025 21:04:25 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e3csm623864785a.4.2025.08.25.21.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 21:04:25 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:04:26 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_6/6=5D_auxdisplay=3A_TM16xx=3A?=
 =?US-ASCII?Q?_Add_support_for_SPI-based_controllers?=
User-Agent: Thunderbird for Android
In-Reply-To: <aKx--dksx6-WUOp8@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-7-jefflessard3@gmail.com> <aKx--dksx6-WUOp8@smile.fi.intel.com>
Message-ID: <70B636E1-DA86-4CB0-A06D-4C0A99FD95BD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 11 h 19 min 21 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Sun, Aug 24, 2025 at 11:32:32PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add support for TM16xx-compatible auxiliary display controllers connect=
ed
>> via the SPI bus=2E
>>=20
>> The implementation includes:
>> - SPI driver registration and initialization
>> - Probe/remove logic for SPI devices
>> - Controller-specific handling and communication sequences
>> - Integration with the TM16xx core driver for common functionality
>>=20
>> This allows platforms using TM16xx or compatible controllers over SPI t=
o be
>> managed by the TM16xx driver infrastructure=2E
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> ---
>
>> Notes:
>>     include <linux/of=2Eh> is required for of_match_ptr
>
>Yeah, please drop the latter and remove the former=2E
>

Well received=2E

>All other comments are the same as per I=C2=B2C counterpart of the driver=
=2E
>

Acknowledged=2E


