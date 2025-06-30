Return-Path: <linux-leds+bounces-4934-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B24AED758
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 10:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA0D7AAB49
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 08:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4BC24166A;
	Mon, 30 Jun 2025 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+9/qABn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436871F1317;
	Mon, 30 Jun 2025 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272306; cv=none; b=dfIaS3yFhDexa+MU8YZMs8a8ddjbLolRS6BOJHELCnwmIXW0UY/ncxo/+LmKDYXP9TUNBwvsufvvvKJ6Qtu70301NybayjqC79a/qFI52/pJ7AFeEPKFmqabznEsuJQHfXhJrOOVNhpysZyqJFSUaxIEBVO/5M9N6RptvEWHWfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272306; c=relaxed/simple;
	bh=gxiKTUjIPpJX72jE2FhnPJpJfMICc6tLKV+XgUhybpA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pvnZ5jTZHWKbvGW5Mxhu1Ws7Uler/qceTuJMGuryex0v7TD6JfDvr+rCFWt32Se/m/PH+Q7R5cX7yZfbe9Pzg/sbyz8pF59mDFKgw/CGYRlYk2+mLJvs4ctsYQXNww/ireiKld42k+H9iPGK7WI49LwGEViBB4Kb2Mi8gvTGP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+9/qABn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5551a770828so913444e87.1;
        Mon, 30 Jun 2025 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272302; x=1751877102; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OshmcBnwF2TfDnNpqHQYtOEtTGgXhczTcUFCfy0wLaI=;
        b=T+9/qABnXcpCer09XCdC/pB3uQdcZieZ7J3dl/dKJMKH2cxwHuKM4yU8tcV+crpMs6
         ixwW38Un1d5uKAHB3D04z0v2y8ePPWFS7VJ9uDzzarZ7KF6pBLe9CIig39JVLPZHKAtb
         M8xE31xo1qYEqSL1cZJNrNRUmFHBuf2JBVaMOT1DlBypeB2de4t1NuNct74XAap7DGhz
         jDE2WZ63mZ5YXYEhTO8YxSMaVKuPUeOQrkH/aDw7tqjSudDQOjySXjL4it1e9nIbhkTe
         /DaNknv7pq4DQ5RB8bFzSk7s1P95VdRvIcYE9HhCPx0Fmq/C46WRa/NIepl/pvEJC/Cq
         CBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272302; x=1751877102;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OshmcBnwF2TfDnNpqHQYtOEtTGgXhczTcUFCfy0wLaI=;
        b=KxwvvdBcVy9YIgYHP1rzDsUI8Ex7haQvOJl7pS9uCOdvZZxs+JQp3WzA8NEJoq3h/r
         Zb20T2PC9ZgJWDj0pxaSKv0DMuhJKdC0VcM9jgXkX1wjrhnqpOXtEa7x/2Wa/rZrLUfE
         K7JDQR+TlrofLmfKH6R/emYVr8PAn534Wv4MyufJrP0h/NeU7UEWRTbIL6KL37xmKYQZ
         geeW+heFRjjtjrQ/zl7uFR9XFexhRzNSwlfDDDrDeTkE7uCSTfGI64vJvYIt5UtzuwZD
         piyqDzdGYU3TLWdoCm0TXw3QopXct3ze4fZ9eRoA0T2D1MSrZ1cX+C1KSf5UYDsmASah
         VUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxp36VbFh/eXrHKWBkkeEQLvoTSoA3KXbi/7e1JEzRH1FS1ZMnaL7dVeo+/2NyFs9pXZDFM1phM933LeaN@vger.kernel.org, AJvYcCWFyVf2j+vMHSj546Sm4Tz5wNHdFjzl7E+eNmjsgvOjaPBiXkRrE2aPRXtwzGRtMFViI7b0X0kV9Ql4yQ==@vger.kernel.org, AJvYcCX+ekFuL00mTCX9WV8rZtRHtue9ZnXYSKpktvPTQbML716/hqyUJUgX3/6685Mhk+5X0Gz13/7j4ya/@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIRHgPDNQv7wWnO/OooocZUAMaPqaIqy5nxMqFs/FMYT18UVa
	TwU7mYhEk6ycbnTiWUF7FQ5zKzrDqKtxcEjgA6xVr9qWOBLYusMM1bSZ
X-Gm-Gg: ASbGncvlS17JbfQMBsDHWUEYo6z3l1LSaOsRSRT3re9igXqFggt5UcVMn2O5kS6Q1H5
	J4D2IJ0uPgMzaMwXpvoMejv7qifX6VGLxeXDYH3M0mGcnVVggYWi91EWct1UXR+9MmjMe0GX/7O
	sc0KjMTpMZeixodxTh7X0xf6ke3fvE1uJ8bbY38MvC6+g0lxNmQ51cf220bMvIZfv0qHjL/4G5s
	NgnFKMZr23KR2L28L0A2G8EunauH6iv2ZQxQA6Bkk+EMM8CKkF/Sd278LIBFJpfLFbqOSWzPfWO
	ZbrWn3WwKjIoNK60DWCzbZn4L5AV49LcBjWSoF80Ym8gzpbGjtJvHqurFaRgGzkIMc7539j5daX
	pMkssgQlYAq0=
X-Google-Smtp-Source: AGHT+IE1QKZLyq6F5mfdpgGw6f0P5pBCenGMP/iG5NwW8Wsk6jpYmi2D3mR7EEF083TGVlyz3Be0rw==
X-Received: by 2002:a05:6512:3b9a:b0:553:a77f:9c45 with SMTP id 2adb3069b0e04-5550ba16fe9mr3405972e87.39.1751272301913;
        Mon, 30 Jun 2025 01:31:41 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f3271sm1320723e87.258.2025.06.30.01.31.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:31:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core
 Electronics
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
Date: Mon, 30 Jun 2025 12:31:26 +0400
Cc: =?utf-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <760A6F11-6783-4B24-9A99-E043297CF039@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-7-jefflessard3@gmail.com>
 <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 30 Jun 2025, at 12:19=E2=80=AFpm, Geert Uytterhoeven =
<geert@linux-m68k.org> wrote:
>=20
> Hi Jean-Fran=C3=A7ois,
>=20
> On Sun, 29 Jun 2025 at 15:00, Jean-Fran=C3=A7ois Lessard
> <jefflessard3@gmail.com> wrote:
>> Assign vendor prefix "icore", based on their domain name.
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
>=20
> Thanks for your patch!
>=20
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -694,6 +694,8 @@ patternProperties:
>>     description: International Business Machines (IBM)
>>   "^ibm,.*":
>>     description: International Business Machines (IBM)
>> +  "^icore,.*":
>> +    description: Wuxi i-Core Electronics Co., Ltd.
>=20
> This sounds a bit too generic to me.  What is the domain name?

Their domain/website is http://www.i-core.cn/en/ and i-Core is used
as the watermark in their datasheets [0]. We=E2=80=99ve thought to drop =
the
hyphen and use plain =E2=80=98icore=E2=80=99 to avoid future typos.

[0] =
https://github.com/jefflessard/tm16xx-display/blob/main/datasheets/AiP1628=
.pdf

CH.

>>   "^icplus,.*":
>>     description: IC Plus Corp.
>>   "^idt,.*":
>> --
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- =
geert@linux-m68k.org
>=20
> In personal conversations with technical people, I call myself a =
hacker. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds


