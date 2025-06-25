Return-Path: <linux-leds+bounces-4885-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCDAE8752
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 17:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F85189D775
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 15:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C4B2627E9;
	Wed, 25 Jun 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1Va061g5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916271A7264
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863698; cv=none; b=TosLPDBH6bxWNoVOTN3gofCUT+2CNlzH1xtM0Ly4rVmBXgSANeAQ2at6tHUJ5pJOikggy8xmAjCAQEfKlYqRrGYrcALUSGBfRXIyyyHqEgRQ/0DYK+reOVlgosSehIBR26mzK92Mkzey38pOnSdXoAk0aEtjn6vSpFhaye7KKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863698; c=relaxed/simple;
	bh=mjKGXvYRAeV0j9q55iDsvNYd/AmBtJccQ5OLEaOQmb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eBVsk0kL6HE8MVgvtjeNVeheGPCnLFMvFxffe4M3Cp/ceHvyJfs9VQf5JJ2XAkm31hgmi3vn77OyVb8UTTjg2QEIKL0YNcutN/5Assz9tNclZg5fzVbEignnHErOfIJ4VAa7JUGRixwAPDjPtACkyEIAj65WkhFpXH+vMK8UoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1Va061g5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso11285311a12.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750863695; x=1751468495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=1Va061g5uxi+ZmMR6Z9hmFQna/WcktJ8rSPg/wH1PoaEqOHQwWukTV1BsfVbhioM28
         /mhOd+nA3mqmOCqFuGyK0MmHyIfjzzcfgiH4WQUmR43mDgKOg7oHzEZ6gEEKtSWCwYXT
         aTJIRjR/uPuz1YcTt9V9lE0UHi31zEEoSyPRyVYo/DnZBerSauhto3Ikp3GTQylDJlNs
         PMED0YTT26CW6it/ijeaDvTeRWNgaxQCshJCnKTPQElyUioZ0OVI+qMrfw/k7fS7SSlZ
         A+C701+WL8QHD1xXTOvp/ELXSvuJVDDcRFLD2TJWSgK+++bU2VUT1Tc6i0v4DsoMoNKz
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863695; x=1751468495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=mzmC3cSl1lqL44c9GsuCLcKQzYgC+UEUWCQvu1Y49Gt0fHzNlFS+nAJg8nbxBXLd4P
         KENLL1cevDjjlq32MLH3BEU104WHKY6mHvgKtgt9/CmwxqcCwN3d0cTiYFZdhQ6JVEho
         tgvvMMHOzEFtMoAGEM6zn2xtRqjJgxTgL+EO7Eb8yclkKYPx6bO5DrSzkko9IG1uVmj2
         OroBIWGRmfUaZqq4ex6R8BMYkJftWHW5oPwn1Y/XVrOfiW1+3qto9SFlSN3/tkACF/n8
         fAlqr0ZfcauqpPEeKLJnMyk9+IYu+9wyXAw7kSXM9tCZwLZEujjSVXlPVGd90HxN0VtD
         Av/A==
X-Forwarded-Encrypted: i=1; AJvYcCVmKjtKwzLNhZPnAUE8PZiz6BQtkDDZ4wCZbQgIQeK399MDMWf5vzK/CbKjVV8jIeSsA70zWChcX0WV@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNCZjAi589mzhLB3c9oLVa+UPYQWNvUSDQfVZYMysrwdRaFd2
	yoeIflQ2C5sxUU1Ev9ji4R9ZT5Y1uDTlJ+/p7R50IoZhBtBtlkfkp12rBdclBxVrWBc=
X-Gm-Gg: ASbGnct5q9BlCGoSXlLCa9wClLTC71FAYHXgJkFgTAkUlbRgxwnMXd930mM7QUQRa47
	YmNYNW1fpehDWuIFZoAq0Lx2oh/FIzZM1+oGVmA05C0SHTu/C/Fzs1f/SNoc2cfEJqccmxcJZoS
	2ihZVSlSXim8a68McRLRBX/4m3G267lvEX0R2CTwFU+mfYrH5dETaUXYCcCSrzAaqXhB6LzPBeQ
	C/96r0yXmQgPclJd1PIS6iITnBWD8aqic/PLkwnk4ZNOj1sNsYkPV4OjzArSmTdOdrAckYJrZut
	ZMQd1aXtor2GHaos1B9ZfSre1j/GhrSkyZ04ZdXnCLneZH3wMnfMb6f6ystnhp6vLapDhX05Vfg
	rxEw5Z9mJF7hGkDiZ6k/msMHJwx+mBkg=
X-Google-Smtp-Source: AGHT+IGR7eTLwLr0fdOCYaZCuvWw+/lu8Yn8bZNjsxmvuaS3Yo6hqW5sayVf685GRx2r82h70xi24A==
X-Received: by 2002:a05:6402:84f:b0:605:c057:729 with SMTP id 4fb4d7f45d1cf-60c4de864a1mr2730749a12.34.1750863693017;
        Wed, 25 Jun 2025 08:01:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196ab3sm2609163a12.3.2025.06.25.08.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:01:29 +0200
Message-Id: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
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
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
In-Reply-To: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>

On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> and the devicetree description for it.
>
>
> Please use PM7550 instead.

I'm happy to not follow downstream naming conventions if being told, but
do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is just
another SW-compatible PMIC as PMXR2230.

Also we already have qcom,pmxr2230-gpio upstream, so that would need to
get updated for the PM7550 name.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>>       arm64: dts: qcom: Add PMXR2230 PMIC
>>=20
>>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 +++++++++++++++=
+++++++
>>  3 files changed, 65 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20


