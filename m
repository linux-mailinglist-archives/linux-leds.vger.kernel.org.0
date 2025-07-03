Return-Path: <linux-leds+bounces-4976-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852FAF6BA1
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE601C43CC1
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 07:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C55298267;
	Thu,  3 Jul 2025 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILei2U46"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C54227BB5;
	Thu,  3 Jul 2025 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528003; cv=none; b=Qzg/o5LiKrf6+l3WEbWJAMoypdekXsMmS0uXlSVlOrM0yhuly2yPwdPhUbOzZ41c8+qUIIek+3WPtAKaWphXQQg+/RGXoO0Fls3nwhg6eou/gQqjnmMy+/hP9BbLR5a78fRwgIlQOovulTM2JWP4JXb3JOtQxrz1JovwIi0+GXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528003; c=relaxed/simple;
	bh=tuLVdbCKa68TtTOLX/EbusqENXfnicxUtW6vguu6Q/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb1ndcm86P1W9TpNYZ5jesp/rxTOpySaQaYdASO9T7ct0zwOuyWwwXMPx7Ck+Vorv8sttapRUDF+nEykEt0JXVm53jHFRDyrTWraEtdyXr651FIC4cXDF+RnnN3RDV5ceO5LcxJDfuxZggYcfrHdpHnDMnD52zW8gr/jlLwhr28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILei2U46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5E5C4CEE3;
	Thu,  3 Jul 2025 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528002;
	bh=tuLVdbCKa68TtTOLX/EbusqENXfnicxUtW6vguu6Q/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILei2U46QoFiSPtYqcdx4hQTjSod0gGTjkvANfO1neJAmtbL06Fg2HW4FRkKPlmot
	 EJymmcVl20AK4sD6V5Tot+VFLglOnvjZqJX+X5MM3Buhi/eb+gSvr3YryNKoxzoqe7
	 3sgZM55Wb99sFgsIbsCZRw7V5M+HiBV1CiEH/Lp8Sd8qSABsRN3ieI9rPNvglnqY0o
	 4LxzHyVqE4HDt7ETI6PwwSYqDLJAKSFjBLCQerXWMdBHSpji/qAGdNLeZJURyglJ3k
	 xIbGRzcH+hLoi3YatX75JS60nBDQMfe0MX+8u7O0E7DJFl5g5P1Q1In8rD2CylY9kS
	 Z+gOE3dXuplzg==
Date: Thu, 3 Jul 2025 09:33:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16XX
Message-ID: <20250703-bear-of-astonishing-typhoon-6afa2b@krzk-bin>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-8-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250629130002.49842-8-jefflessard3@gmail.com>

On Sun, Jun 29, 2025 at 08:59:56AM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> Add documentation for Titanmec TM16XX and compatible LED display controll=
ers.
>=20
> This patch is inspired by previous work from Andreas F=C3=A4rber and Hein=
er Kallweit.
>=20
> Co-developed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

See also submitting patches explaining how these tags work.

Best regards,
Krzysztof


