Return-Path: <linux-leds+bounces-6575-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E613D028DF
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 13:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2D0E33FDDEB
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 11:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EE140B6D2;
	Thu,  8 Jan 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzZZOBOH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC593F076D;
	Thu,  8 Jan 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867003; cv=none; b=UVZaN8EjTXGOSWvBTNV0iXVh1Eui/wGoGzXo1wQE9iQ3pwiKWzT6zdVuL1pdSYd/KtFsQbLzaHWOQADnxeh9bWcv0PL8TMGHK9OzVf4Vxerlf9q0BGjhblNb+5aYMhxZKNnhAg4dQaYORDVaWJZr0y0HDaHNgf+xH4iXZ4eTKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867003; c=relaxed/simple;
	bh=jhGglnHR79yKqzMve8kZuUJdzdwyNEoqDK2d7uLN0qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk7cxevvkzZH1t5sRNiG+En9ARtCZJPx1espBui81a60e3NkNOwGSBMf0KeLRDbrln6eQR8L7f+l+6PC8uACmq122EoVd8aYTggiMYORTaIZbkZufh+nRpTcE/aJt1eBsuHc9G6eyphzgwnaXU1YVoFkcBrLhsAOjDZBYh8z4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzZZOBOH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BF1C116C6;
	Thu,  8 Jan 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767867001;
	bh=jhGglnHR79yKqzMve8kZuUJdzdwyNEoqDK2d7uLN0qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzZZOBOHwTd6nrl3/mbpOCHau0gCfmiYTDmWCyoFBGa4zofYuWFQz+EhZZL+46hGX
	 bKrZAD4dVcQXwVVHAUS9Lf1fclm7MLcc7nuMWEHhn/bWIjO3zb3OBsF9VaWLAA59hz
	 ioZoAOIPycOm3zpmADzhBEe+cMfNFw+VMNAuZjTxO8vmbhUs4sCuOFNub935V1fHSB
	 wF/I3/cfExGbzozL6uhKb0aaD9Ou+linoMAj40L4CbOaFNbD6wzEUjz2T0uasVwU0E
	 v0gqkJFm/Rxa/OR9Eclq2tXEuURfL+HxpFUlIkMpbrRY+rB/zVTlmudeGltnID8pC0
	 4zlPsVHHIg5EQ==
Date: Thu, 8 Jan 2026 11:09:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kiran Gunda <quic_kgunda@quicinc.com>, 
	Helge Deller <deller@gmx.de>, Luca Weiss <luca@lucaweiss.eu>, 
	Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla <atafalla@dnyon.com>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
Message-ID: <20260108-illustrious-original-harrier-e93aaf@quoll>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>

On Thu, Jan 08, 2026 at 04:43:19AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document ovp values supported by wled found in PMI8994.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++=
++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


