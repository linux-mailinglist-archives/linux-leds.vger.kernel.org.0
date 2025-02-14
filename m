Return-Path: <linux-leds+bounces-3986-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96267A358F3
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 09:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6C616AEE3
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8B3223339;
	Fri, 14 Feb 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTgsJJGr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E620ADFB;
	Fri, 14 Feb 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739521997; cv=none; b=AHucKoo9MmOy2K3ey2k14odhxKBZ7ylYidPu9143FChHJ2S2HduZCoG/EKXO9gUdB3bhfac9dYbhFvWVKOVEpu0hQdWgWqin1k4uBDwa0MuwFAUJQDSxggDYt4D0s6DRncN+wOXZc9qgMEoN6mt2xwqmHpoGJNGnQnILSWL0q1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739521997; c=relaxed/simple;
	bh=7HIkH/KEQQIflBpWCsurCpwPb9iVOK6yYecA0UCy8eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0vlgLNI67hgyVg/aI1CfpRvnz5bNuYjRzCTWgTL+K/VTF48ifGZ/C99DbkYWO+WlU/mq3f0QbxssiVA7y9Saz7W6q9C5XF7TppcZ32aAIeerzPOxPtP0yUTqyDqY2VasL8inw5/U9CtasJbHhGLoM55+s3+MT9uME45ohdPhR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTgsJJGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3F7C4CED1;
	Fri, 14 Feb 2025 08:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521995;
	bh=7HIkH/KEQQIflBpWCsurCpwPb9iVOK6yYecA0UCy8eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTgsJJGr/cKHok2Q+pWAy0B5vKQIIaGC5Vaj1z4Gq4N/BiLgGQsGbrOCyPstKyeQN
	 cuVBojvP9p9aSBDOotLBaGHChIxmMzHLz22cpm8g3Rb+GmEs70N3n52dMIQnBlnQSI
	 VuwygdG4BGQudiyFDuNtGnuahvt1gk9QhZOM3H09dJmQbWHjYodZVepnPQT6ovAtiA
	 Amcg7SUtmc8xqnGAlh49asP8xqwuToW+rkysjMwf/t67yT27O0u1N8e8COjhOQuNQa
	 M9zic8a3uojE6KtHEYUEQh8mjSVYNXhnn+6wdm8H1WYb5XRCjd98kArJDX0p2DmJk9
	 kzoU6Di2IwIWA==
Date: Fri, 14 Feb 2025 09:33:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: Document PM8937 PWM
 compatible
Message-ID: <20250214-muscular-arcane-chachalaca-fdfacb@krzk-bin>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
 <20250213-pm8937-pwm-v2-1-49ea59801a33@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250213-pm8937-pwm-v2-1-49ea59801a33@mainlining.org>

On Thu, Feb 13, 2025 at 08:54:47PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> The PM8937 PWM modules are compatible with the PM8916 PWM modules,
> document the PM8937 PWM compatible as fallback for the PM8916 PWM.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


