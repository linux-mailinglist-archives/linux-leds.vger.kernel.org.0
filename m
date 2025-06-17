Return-Path: <linux-leds+bounces-4831-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB8ADD322
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 17:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BDB97A4FCA
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 15:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C636E2ED863;
	Tue, 17 Jun 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2+WUSKW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999532ED85E;
	Tue, 17 Jun 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175368; cv=none; b=O+0FCXvrYDcvfuAYJ+EiQLUh294Uktc5HgujYDmR30ukN7y0mN85LkwRcXBsqHc1Nyc3NEhVkcwUh9GOvX526MKmYQlLsW8Ik6Ft62JM+66z6SzGL2/A9TuZ2FmbRPxNs70OSMhDIJ6pZDDFsKvYERwbaiiYp+enQv5ptiOrjBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175368; c=relaxed/simple;
	bh=J9oMbmShMBwyDQ/tGdPNsPTnDkBvW2Z4NZYdloMlUEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtbNbCBadtK9RxuH5jOM7SoaVtZmp96oIEVU9v1usfVXpTWHTtdEvZuCEyteIMxDap4zHI5Gbw5iPtxue3jC/v1q7T2iS7V2EvaM6S5OesMeRGPePWjJbeGHB4+bSzwqZFJN85aYGnNBMEzlXHqu9QKlAHKJGpuGnqFS6JdJsDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2+WUSKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFBCC4CEE7;
	Tue, 17 Jun 2025 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175368;
	bh=J9oMbmShMBwyDQ/tGdPNsPTnDkBvW2Z4NZYdloMlUEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2+WUSKWNBhhe8co75Pk15Ptim+87pXW7dD7x7jFxCYUG5ZR98jr3PYqV96SXzpjh
	 pmeBx6mBtCgbpJBnpm4zpyRGjNxLke+5uuGHCsDwbLZQtpWFnGAGiZR+/GGyZ1T0Cb
	 S/EOeuKXUgrTmc4uid6lMfIo+WvYxBJjs3i1DuvYsLjjGIXyNAOs5tjlQr1RjapyPB
	 FwBn4huYNiTM7/HYHUVnE0t1+0YjQDNc6SJdjOLT3/IPG2kWDHT6M70w/k0NEiRkaL
	 k6eM86dSAEmLbFM0vu+o/Ylu6SLneR+6RX4RVv/asmfIdRGXEQ2y6wKLq5Ua9JdfOx
	 OkJNobgZiYDSw==
Date: Tue, 17 Jun 2025 16:49:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH v7 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Message-ID: <20250617-silica-ivory-203304262f1d@spud>
References: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
 <20250617-led-fix-v7-2-cdbe8efc88fa@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YvizlM+cDccivYjn"
Content-Disposition: inline
In-Reply-To: <20250617-led-fix-v7-2-cdbe8efc88fa@axis.com>


--YvizlM+cDccivYjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 17, 2025 at 12:23:55PM +0200, Johan Adolfsson wrote:
> The led child reg node is the index within the bank, document that
> and update the example accordingly.
> The reg property in child node is limited to 0-2 since there are 3 leds
> per bank, previous value in example was speculative.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YvizlM+cDccivYjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGOgwAKCRB4tDGHoIJi
0vL9AQCxwYHWTQElTIPKh9Qb+q/TeAPvxchm8N0DaaLWmdF6PAD+JQp0P+1RbAll
Q0j0RhO73O57r7lUvqUsOFc4Nr56MgU=
=tzOq
-----END PGP SIGNATURE-----

--YvizlM+cDccivYjn--

