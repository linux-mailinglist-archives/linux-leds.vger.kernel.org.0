Return-Path: <linux-leds+bounces-4897-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97AAEB3B7
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 12:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFAE716D9F4
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825A82980B8;
	Fri, 27 Jun 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IMYu/edv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C42294A1A
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018713; cv=none; b=O295CzKRtw1//oV5LJd09WbUPO4Wu2ACevuReKgHtp6S33BFfLCoN1D6au/8REiEhG4w24fNDRPvrPFiqJ1ADbHuzKTNLed2JWZnUKGXK2X0x65N3cOSanxwtQA3aqG6dDbO6JzFpxL5imNIq/7R5kWxvcwTM6JWnUiQpYl6I3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018713; c=relaxed/simple;
	bh=PzodW/i76HLnJ/LNXOIZcjxrEUiZHsILg7HZqKuQym0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=c8HZZQYuuE7LfV+YhPyGS0c9GhsYNvjpXTtu7i3jouIJ1F8CPue6itB+ykqYmMaplAZvQJycIs2asdmpKzln+Mnby/3atwe+Kdnm+45/kyyXLJgLbISO3K+bl176qpUVQfmv/xGtfYeEeKlmpzNfOaQ/rkVoAU/SxeniDmNQxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IMYu/edv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dd62f2adso299950866b.2
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751018709; x=1751623509; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anf81smqJchGsOVnXL8fS0CnM4B+sUev4ipz3NBZjL0=;
        b=IMYu/edvz6R/wTiowuSLY7bajTgBUW6dIUbFr21K2rZsozX0X8MI3GEaj1y5tskZPg
         J3dtKSBNh/ClN1IjKS0Iz8SGe98n4vQuu9GGsWt6BPQ6nKldsl1NkbqVvANXo035qqKf
         lXVB8FK6XRcg36jo+XsUP9eTfRBNhHluLrvN86Xk7MJ7fgI/wQKN3fNwCgHUfZbQ1y9a
         9cmL4/AoKZKoIxGrIYU3s1pml3BnnxGdOjxlBzP8qmaNk/S3wQnYu1OAGV2XJqEoDNZW
         X7xEJex3PsfApdsPLEiqhxerwQbMZg4HnHnlAFYbQDmNYVB+KvVsNvkKh4Fpup8ZXafy
         cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018709; x=1751623509;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=anf81smqJchGsOVnXL8fS0CnM4B+sUev4ipz3NBZjL0=;
        b=AS8XDLAilnHX+pzRRESr/Iuhtgf6SG7YjE8NSqQEIe2H7d70C/Nam8aTV/c8Uga343
         10zUJIqzD8VpDQbaeD5EDd4lreRLw3bkmjuV6MTMrRVWX8KTzA8JFeEFnCvhCNZEgDGs
         5iWhdGLaknANk2wpYYtmslvib9UI9HdYPpV28H2MPLZ+iA4vkOO3I2ss0P+U0YwFtnKf
         6v6jCVJMZbWfOQTVxH0F5oWxZBR1dVhb045wTLWyMY61Jjl7pTz5FTiOqOwJZQDwOekB
         5I19A0YDMdTw3MAg/lJphzJECvz8AqQXvXfLnZ0uqAv7cY9ZD8GSrS8R/J/7jTVXcV7v
         j9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUrAYtPL8X4j3eUQhDIngsP3ICk7qkJQ9nA9n9WneGFbeHZ/5F/IBNoncm8kvgL5Uqhfjj47Z5a1vId@vger.kernel.org
X-Gm-Message-State: AOJu0YwQC497UDVIJtDEwdY2IPpNoDDX5R8EmJVcOVXzRdybeqrghFAR
	qvIDKkTvPJx7MlC+KkOtqi9yO9/1qtRgjdbfMetjEpNfQR8NDTWMha3kL/LYY7GVMME=
X-Gm-Gg: ASbGncspRcGIBgTYwdcIyfGzFshjihvowaVkJLSSIDLpkrlQZcOScc5s/86HwGO5aJT
	E2tI6EEi4rfK6ZGG3eJzyhTdFKMmvLxnukvPjUUm8fzP0YAPPYrdXoMQaoPym9EX8nLwnx/N0Ao
	j0LSlplqnz4mzPKAjmHkPJz7ipppcfviq0jXEGj+GVRB/rJ6cekfv+kAWyt8GfkLRBNv1B8djsI
	zkFAfhs/I2V1iDyYfnGUeiWR/GsRngfX/P8HRtMgGGfkLYc4p5Zgi7YzLj3O6gk3Fp/RbhWo5bj
	ZwHt/PyKGvJurs6hiNyh7jpYDnVq1zYlCObUHeqrMoBJOcXQzMhPt+2g3vm/w8JPmKp06tg+s6E
	eSa/ERirv5+oq4a4LiuEDWFEqlonFEp0=
X-Google-Smtp-Source: AGHT+IFwWC1PMDQhvOXj2QsK6RpzwF856rVEhA2uY1DKJrMoYsifyAHyLePMov9FHDkbpt1Ej/CUTg==
X-Received: by 2002:a17:907:d24:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae35018f138mr209250666b.50.1751018709055;
        Fri, 27 Jun 2025 03:05:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca217asm94148666b.161.2025.06.27.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 12:05:08 +0200
Message-Id: <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Fenglin Wu"
 <quic_fenglinw@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
 <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
In-Reply-To: <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>

On Wed Jun 25, 2025 at 11:03 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
>> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
>> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> >> and the devicetree description for it.
>> >
>> >
>> > Please use PM7550 instead.
>>=20
>> I'm happy to not follow downstream naming conventions if being told, but
>> do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is jus=
t
>> another SW-compatible PMIC as PMXR2230.
>
> It is PM7550.

Ok, will update in v2.

>
>>=20
>> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
>> get updated for the PM7550 name.
>
> No, leave it be. We should not change existing compats for no reason.

The compatible is not used in upstream dts though, and cleaning up some
old naming for the PMIC would be good, no?

But I can leave it for now, and we can potentially take care of it
later.

Regards
Luca

>
>>=20
>> Regards
>> Luca
>>=20
>> >
>> >>=20
>> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >> ---
>> >> Luca Weiss (3):
>> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>> >>       arm64: dts: qcom: Add PMXR2230 PMIC
>> >>=20
>> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++=
++++++++++
>> >>  3 files changed, 65 insertions(+)
>> >> ---
>> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>> >>=20
>> >> Best regards,
>> >> --=20
>> >> Luca Weiss <luca.weiss@fairphone.com>
>> >>=20
>>=20


