Return-Path: <linux-leds+bounces-1675-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA88C69D7
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 17:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88031F21EA4
	for <lists+linux-leds@lfdr.de>; Wed, 15 May 2024 15:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9919D156225;
	Wed, 15 May 2024 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyLRWN7s"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDBB155A5D;
	Wed, 15 May 2024 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715787333; cv=none; b=cKPf0E30jzVR/kvYVmqvsO8pT/jfIyCBR3DRXuTbcU312IIC2d4I3p9ZmxBhh8uTSrZaz9aZBiGINV14ZkRQszO0KKo3cOU/ezWa5Ijhio8htXWLLB9rZaxyBWKURKYBszrUfveCbRZDr5NCOzSB6RytwE1PUXAxvZwvVhb1Mi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715787333; c=relaxed/simple;
	bh=PKfmFovQLFA2KHCLhrbCygLdQnVBp2YyHOoxGY/O5gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go/iN1mYegvw6Z8aGMoon01Z48JvPEpA8uH14BcpkvX5CVLJvc4kSUcY5DgxXO0p6NFrvWTTUjC7wNdMUtS7FtUxTXlRcJxfHxRu/mvsRa4O7ZHgrTcXvpq0RzXkC/dTnOn34SZhKXG/joCeKE8f6CTfSPNXR+FSjeIrUJv1V5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyLRWN7s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDE0C116B1;
	Wed, 15 May 2024 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715787333;
	bh=PKfmFovQLFA2KHCLhrbCygLdQnVBp2YyHOoxGY/O5gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyLRWN7s5w85foJP9k0DCQ0bn4GdHbOlQ88v7DVag4+FLsJbtGj4KeWij9kQlYaOH
	 ckkqzNbbbEIuXG0AqBTclOwszErVbQoXoS7CgcJ/02U0uTTTQ0GZSp2DWuXKWITMny
	 LCFcTmnbOZp4GZcpyqWOpGJSN3yg4sbpA8JbwIs1hliKLgD9uvL5qnS8Lt1I89yY3h
	 zvz/O+7vurchlJPuh9tKDETZEQUQmvIjYUvBWMt6hwoUixhKiGBoVkiUDIzgcjWQDR
	 rydtsVNieqf0KIGOds+LKtcq6gXxNYOh99vc4gASOuRh/WNDOBpYYUTIJSZg4e1mI6
	 SDmedoAkEuk5w==
Date: Wed, 15 May 2024 16:35:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: leds-lp55xx: Add new ti,lp5569
 compatible
Message-ID: <20240515-grinning-showroom-00e1379a117e@spud>
References: <20240515143129.31557-1-ansuelsmth@gmail.com>
 <20240515143129.31557-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+3BkgKLxQf9ymS57"
Content-Disposition: inline
In-Reply-To: <20240515143129.31557-2-ansuelsmth@gmail.com>


--+3BkgKLxQf9ymS57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 04:31:27PM +0200, Christian Marangi wrote:
> Add new ti,lp5569 compatible, this is similar to national,lp5523 with
> slight change to reg order and reg type and advanced way for LED fault.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--+3BkgKLxQf9ymS57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTWQAAKCRB4tDGHoIJi
0lrpAP48flHsh2TCVgtgZe5esB4JortNa4C7ivb/Fkz34a3XnwEAzQEygxu+jyw5
tSVZZ3UWEA5C0Wx8iURp+Ucj2yRT5AY=
=5be5
-----END PGP SIGNATURE-----

--+3BkgKLxQf9ymS57--

