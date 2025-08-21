Return-Path: <linux-leds+bounces-5278-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8BB30303
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 21:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E042AE0182
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 19:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9B334DCD0;
	Thu, 21 Aug 2025 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doPq8bt+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E634DCCD;
	Thu, 21 Aug 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804956; cv=none; b=ctEx1hXMtVLruwvLlM/y2Xa/6y/cxLWiyo4ZyBtDrjvrQdhwoNQbxo34t7MlS8TLBevUjzgnOQmkiCmz7EvkLf8wi41LY+zVFkSW4AFu9Mn1v0c4Ulprc/2y5MOPW5dzrW8fr5TuXNaf9hBSx4eQQZR3AEiRBEiN0Ge58ZYcQFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804956; c=relaxed/simple;
	bh=nVkPWeM2VTlHY43nH/D6kyxCbKpvtPzXtt4o4wawSbY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dE/tuWGQPbkC4AUWJG3mDzjwu2LHmXZghV/t1MFtHWfuNg3gpj+qoZMkzPmxTrhui+Lz11YVUCqw7W4K5ByGjLlGMdznkJQDZvYlbg7Z1rU8CnTF17TjYsrW/F9qfBW4efLUm4BI+BMFTvVLQgCekhyw9h8VboLNkMFE5KYMKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doPq8bt+; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a928cca6aso8469926d6.2;
        Thu, 21 Aug 2025 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755804952; x=1756409752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IaH0BrwjcupFM4YBlCoOWLYie+AkezFRRXk9KpS8wBE=;
        b=doPq8bt+gxy3D+CqXDeK/DikiGZSnTA6Cw7/axK2viGlTT9DLFAoqCSmwg329lNZDb
         HmlJllkzkjotmo60D2z5rWc0WqDmRU8v1ReymqcE+LKhPPGGkSkxrZrDiDurKsQhfK/p
         5VSYSmBlUPmx9kokqy2GIZV2bPQj8U5QfibvqPMqbh0Tw9R/9zjnX0Plggwdk64iDQCC
         N8URcEI92zqmCQ7YuTqKPxH208y/oQ5r8q31GLoVHaMAQLFV0oGgkD0mhqnqnmc/G5n8
         FemM+vpKUFjsxCQNP/d0AVGuO57ZwlGIzvBwQ3mpZUn9Tx/8p4vFu4Mq/5Jj9fgTMq8m
         /1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804952; x=1756409752;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaH0BrwjcupFM4YBlCoOWLYie+AkezFRRXk9KpS8wBE=;
        b=JQMIdTm9N/PHT0n1llHk79vBAyOOPckIcUX27desngv7Nd++C9LfRQ6gJDH0qfoMtM
         ssy9qOWAPsoLJQpx31nqWhDuDIKi4MsAPoU2Nfll+7RFbGUEmljHJInaffIe8d2M96u4
         x7wORr0b9+mGK1IkXn+5fmyFSnK4C14K0BDrtccsDZXuy4DqKU4vrEDN3L6G7d+cb+OH
         Z6vBmbGdSQKEER3pPsnRUGrTXv+8xj/lPC0swbUSBbY/BJB+cyN6msVjFJ8sl49o3F/O
         xeh3M/qcBQshvI4/WcCiK9PhF6oBciuxSUnvfywF0pWVmPWrQPrOm1MCwXG6Muf7PEde
         ck0g==
X-Forwarded-Encrypted: i=1; AJvYcCWlL7obTkBhEg/d5rjstxelBUw5CsWvpCv0i0u9SckaXPNf/jTZLdhm/xkoERXKXUUn0Kc98wL4Ob2aJA==@vger.kernel.org, AJvYcCXEHiwVbS+D3CJ+Xx4mvLkGUsC4Hrnv/hsT9DVAIzTQNXBjAZGdxiRjezHiYmwXK7kCqo6+BuweR8WRdzon@vger.kernel.org, AJvYcCXPq1QQBMfASJoE781Ns2Cp3J2rHESJqmRMUow9MwgRnmU02LIHDMMpC6drFcIXQuJXxm/vbWaEHaLp@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSmGg5SLZgUqY1o1UWZx5Z+9Qwr1R9GqyEc8b1ckX+wOz6ISQ
	UU6UqfTa0NZXvd8gl5CzCzLW+VukK+JCRa6GeilSoJfqSiOELZOYhzDW
X-Gm-Gg: ASbGncuUJ1VNImyt0QcYYWqqTJv9HWGZUZOJIQ1DfIbSNWSH64HdsXe29AchynnGftg
	NvWmV0W/HdXS0IP9IWZBpp2QU+KbUjDd8M+YJVxoztIDH/eLXjViuSpFQwpJsinddIgIYav141c
	+Temd9E/vY+GuSBvb/ywmLxWtxn99fiCsZfktLpUp894sd2T1i2MukcwI+gM7M1JVrYWWpwFEEY
	FEXO8IjTGEx0VrKN00VonuV9LHmPg3ud9EXv3OmwWolc1ih6rwLza7HT+tZq2TKdn5kmXHNAsnM
	6Ot6O2jizpjpL0Jj/KTb5XtGM+37BkKs5ReJiPhoUkUZ55KP+l1wAskuP82cLesvP24YMtf4Dvj
	Gv78JASYP8/mOYy77YpH7VH5j5OCixaNEC7Uy8JwBTrNdZ8DdtZF1GawwQ2uhfYhW/KbDtQ==
X-Google-Smtp-Source: AGHT+IGWB7NFk3FzkekiVSwBjYkxzG0QVyrijDOcfSqNrRumwsCj2qCbwErx67O+FrGq2MwdU0wTxQ==
X-Received: by 2002:ad4:5ae7:0:b0:70d:6df3:9a8a with SMTP id 6a1803df08f44-70d9740287emr8981486d6.58.1755804951898;
        Thu, 21 Aug 2025 12:35:51 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f819sm111603336d6.9.2025.08.21.12.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 12:35:51 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:35:51 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Conor Dooley <conor@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/4=5D_dt-bindings=3A_vendor-prefixes=3A_?=
 =?US-ASCII?Q?Add_fdhisi=2C_titanmec=2C_princeton=2C_winrise=2C_wxicore?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250820-wired-deserve-421d76bdd1c9@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-2-jefflessard3@gmail.com> <20250820-wired-deserve-421d76bdd1c9@spud>
Message-ID: <6A80188C-5108-4DE0-9D69-F492FD7E6B8E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 20 ao=C3=BBt 2025 16 h 08 min 01 s HAE, Conor Dooley <conor@kernel=2Eorg=
> a =C3=A9crit=C2=A0:
>On Wed, Aug 20, 2025 at 12:31:14PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add vendor prefixes:
>> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co=2E, Ltd=2E
>> - titanmec: Shenzhen Titan Micro Electronics Co=2E, Ltd=2E
>> - princeton: Princeton Technology Corp=2E
>> - winrise: Shenzhen Winrise Technology Co=2E, Ltd=2E
>> - wxicore: Wuxi i-Core Electronics Co=2E, Ltd=2E
>>=20
>> The titanmec prefix is based on the company's domain name titanmec=2Eco=
m=2E
>> The remaining prefixes are based on company names, as these manufacture=
rs either
>> lack active =2Ecom domains or their =2Ecom domains are occupied by unre=
lated
>> businesses=2E
>>=20
>> The fdhisi and titanmec prefixes were originally identified by Andreas =
F=C3=A4rber=2E
>>=20
>> CC: Andreas F=C3=A4rber <afaerber@suse=2Ede>
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>
>Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>

Thanks for your acknowledgement, I will include it in the v4 submission=2E

>but some reason why all these are being added together would be nice=2E

Do you mean repeating this cover letter v3 changelog note in this patch:

v3:
- Update vendor prefixes with documented rationale, in a single patch,
  per maintainer feedback

See https://lore=2Ekernel=2Eorg/linux-devicetree/491ec8dd-8ca5-45bb-b5f4-d=
fd08a10e8de@kernel=2Eorg/#t

Or do you mean the relationship between these vendors being added here,
such as replacing the fist line of the commit message to:

Add vendor prefixes of chip manufacturers supported by the TM16xx 7-segmen=
t
LED matrix display controllers driver:
- fdhisi=2E=2E=2E

>
>> ---
=2E=2E=2E

Best regards,
Jean-Francois Lessard


