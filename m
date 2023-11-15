Return-Path: <linux-leds+bounces-16-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B77ED1D8
	for <lists+linux-leds@lfdr.de>; Wed, 15 Nov 2023 21:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B262816FA
	for <lists+linux-leds@lfdr.de>; Wed, 15 Nov 2023 20:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E1441A81;
	Wed, 15 Nov 2023 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiQsJcib"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69CE3C462;
	Wed, 15 Nov 2023 20:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F14C433C8;
	Wed, 15 Nov 2023 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700079278;
	bh=u27jYiyCnPvX7BwcogXqTwm0JCokegPD0Pe+zFt7/vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiQsJcibVMrhAUxdRs4u55T1ZRdXUaqXl0B5FwM1xxy95CP56AwkQ1rDOe8a9oRoM
	 Z8/1VADpjkogA5+7sakttqxM+FIdPYZCb6phOXReJyup0qXLXDxcDlBED2qrZ9pEK/
	 5d23ZF8mirTogRa0OaIJ6zSozfBveBNkof79iV0xhe4z7yoIHnXwn6mqxh1h426RzR
	 5BDgd7OCfpaenn5yZ96T8LtORT8jEzmRim8o1D82D5BBkWn0IBuHnMgWvXhB4dr07X
	 VKcfkO78iZsKEchmMDJOT0SGiuzm2EaZdxuf33hGEk96KPL2GK8EUKga0NP+ACePHB
	 q4fkFIRbfc2mw==
Date: Wed, 15 Nov 2023 20:14:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: backlight: mp3309c: remove two
 required properties
Message-ID: <20231115-showdown-blame-06a9acb63506@squawk>
References: <20231115152902.851715-1-f.suligoi@asem.it>
 <20231115152902.851715-2-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7YInnrzDKNO+YsB+"
Content-Disposition: inline
In-Reply-To: <20231115152902.851715-2-f.suligoi@asem.it>


--7YInnrzDKNO+YsB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 04:29:01PM +0100, Flavio Suligoi wrote:
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

You omitted my ack that I gave on the previous version.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--7YInnrzDKNO+YsB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVUmpQAKCRB4tDGHoIJi
0qqQAP48sZ0PpimqIgeXVDtIsAnRBgLRK6J12gcofe0rmm2dTQEA6AsQB7AwImc8
T8U4C7CkANMlEQvcOu1fB5Bl5KkzKgw=
=Z3fk
-----END PGP SIGNATURE-----

--7YInnrzDKNO+YsB+--

