Return-Path: <linux-leds+bounces-6576-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D265ED03A35
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 16:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6447E300C34F
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5713A900D;
	Thu,  8 Jan 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aeif+1Gc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801AD3A7F64;
	Thu,  8 Jan 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867473; cv=none; b=Ta+hcc3p8NXvh7PEVc/OhwKrR+RoUU8cvUPjX+hTZt2VlohZmQRUi4EfIY9QE7O3LuN/qTKtscwLQ1JTohrWFNjt4EFArDi1qzBHHWKaPIXXjcyFGCv4sVCnBglBJfjDLhs2Qf39JVShIX5Ifuny6hy1USRT5K6avil9MCDV7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867473; c=relaxed/simple;
	bh=FlOcNDp9sNM8DLGW6Xw6lFu1fBpLA2WtnpnC+96/W5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLNrnX25An4OgTDBHeCV5Epk/NHhPuMyV8f9/UU013V0UE774cMZzCMILAE8zo29NyvhL8IGzsrEyzr9rzluGL4FxQ/1MbJqxfothE+XYL/enzxxw61vkxcmNxP9oL81RIWQuxJ2nWI8Vu+LhDx0KJR03YRW5cXvjzEC5XrKM/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aeif+1Gc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93A0C116C6;
	Thu,  8 Jan 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767867473;
	bh=FlOcNDp9sNM8DLGW6Xw6lFu1fBpLA2WtnpnC+96/W5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aeif+1GcIvuHYuwImiJbr7JLCjanX25RFT8jtzl+0B446ERGcm1rBvHQybzUYoWZW
	 9YjQP26sK8bjLESF+VjCB9A1Ea2Q7RonkyEnyIVPin0FUP4y2QT+sFf9nhcOeSmuKg
	 gLdcVfdh4WPOcp0wKqqNLmiOWHEjzDprtSOMyW2l34Qpd5F64IgjaIvczRPox2x1Mh
	 sfWz7XDTtaAKkW+B1hbcJlci1j/kxMd5sb05i5WqmQyhkYffeAIPy0u8Auv7znvay2
	 bsWRFw2nKmBMdfO6nVij1WSP116/IuNWhZM24njd4EiI0tUJ/tyDXRqIQpBqKr3HnJ
	 P84xYWGcGgl5g==
Date: Thu, 8 Jan 2026 11:17:50 +0100
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
Subject: Re: [PATCH v2 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
Message-ID: <20260108-piquant-quiet-porpoise-b502b2@quoll>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>

On Thu, Jan 08, 2026 at 04:43:21AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document ovp values supported by wled found in PMI8950.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


