Return-Path: <linux-leds+bounces-4991-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD2AF89F7
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 09:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C852168B98
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 07:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31B528507C;
	Fri,  4 Jul 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZBeoqWr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB727A10A;
	Fri,  4 Jul 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615448; cv=none; b=Tv3M7p0XvKqWs02AmfFSOllkkhVJEMteV/khsuo+2WsQetX3t20zOaH90pN3XiLYnNjomoBj8Ax0rqo9SY8I0tKpCGZCEyh2yQP/8Fd4H04BeXZ3MhNSCu9CTN/EkL/lAfdv/Wg44WmZf78JP8J81OyoAlAKOLFZD2Qu1tcayII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615448; c=relaxed/simple;
	bh=SAV3OOw7TJ9qXgDYsbQ0R6rToSQAXqWdWPlOqVTVQFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz4k1bQWyCPXkpvn+eXIS3ahSpRh4fXe3NWhfAar/HeIKJb1Knc0w5bL+rvYpT09JqlmvCFgYvWvCB93pjEyvEbS/NfeXl0ibVEnFXA0/7sEG01YNvPrzamP23zYW35c7kRZn9Y6/2rL4qmXteU2wdgCYVrlzJl0Ksy7PFXjJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZBeoqWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A80C4CEE3;
	Fri,  4 Jul 2025 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751615448;
	bh=SAV3OOw7TJ9qXgDYsbQ0R6rToSQAXqWdWPlOqVTVQFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZBeoqWrs0zzhCsY1tDneN2o3SAwe7xSg0ID1BLE9cePwRqORDfsZ4W+0YrlzDIN2
	 9rzeauKqM1I7Jqw/EnVEUgh8Pa0Mxbtv9R0cFlihRsQAPwOqpjKq0x8JSWBYcEXi39
	 Cy6PZG6CLK3Iz9bQgWR8E9MKLmCi4OFeJnrtYwA++LYEcgKszj3Zepv50x3Z2TBxx8
	 7BqKLWKvNikA0tXCchXT5ZlrjARLePNhLD9pczgdNfy0g0harPkCK+4zxy6/8sBOxs
	 YJYMpVIrIszMerQ5DR5J7neAiFLSHlAsuo/FmeWGSsGZjWuKifKqzsMeeB6qLu6jO9
	 d1fRK99PCko5g==
Date: Fri, 4 Jul 2025 09:50:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: "lee@kernel.org" <lee@kernel.org>, 
	"pavel@kernel.org" <pavel@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Message-ID: <20250704-devious-badger-of-contentment-e0a00a@krzk-bin>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
 <AM9PR06MB795513A172A70CB09462FCA8D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM9PR06MB795513A172A70CB09462FCA8D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>

On Thu, Jul 03, 2025 at 11:36:10AM +0000, LI Qingwu wrote:
>=20
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, July 3, 2025 6:55 PM
> > To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>; lee@kernel.org;
> > pavel@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; linux-leds@vger.kernel.org; devicetree@vger.kernel=
=2Eorg;
> > linux-kernel@vger.kernel.org
> > Cc: GEO-CHHER-bsp-development
> > <bsp-development.geo@leica-geosystems.com>
> > Subject: Re: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios pr=
operty
> >=20
> > This email is not from Hexagon=E2=80=99s Office 365 instance. Please be=
 careful while
> > clicking links, opening attachments, or replying to this email.
> >=20
> >=20
> > On 03/07/2025 12:27, LI Qingwu wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: Thursday, July 3, 2025 5:59 PM
> > >> To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>; lee@kernel.org;
> > >> pavel@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > >> conor+dt@kernel.org; linux-leds@vger.kernel.org;
> > >> conor+devicetree@vger.kernel.org;
> > >> linux-kernel@vger.kernel.org
> > >> Cc: GEO-CHHER-bsp-development
> > >> <bsp-development.geo@leica-geosystems.com>
> > >> Subject: Re: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios
> > >> property
> > >>
> > >> This email is not from Hexagon=E2=80=99s Office 365 instance. Please=
 be
> > >> careful while clicking links, opening attachments, or replying to th=
is email.
> >=20
> > Please drop this, it is not relevant in upstream discussions. Use norma=
l email
> > client which will not produce useless header above.
> >=20
> >=20
> > >>
> > >>
> > >> On 03/07/2025 11:34, LI Qingwu wrote:
> > >>> some pwm led driver chips like tps92380 require a separate enable
> > >>> signal
> > >>
> > >> Sentence starts with capital letter.
> > >>
> > >> tps92380 does not have dedicated enable pin. It has VDDIO, which
> > >> serves also enable purpose, but it is a supply.
> > >
> > > So this patch is unacceptable anyway?
> >=20
> > If you make this patch for tps92380, I think it is not correct. You hav=
e entire
> > commit msg to explain the hardware and all unusual things. Having VDDIO=
 and
> > EN pin is unusual, because you do not supply power directly from GPIOs =
of a SoC.
> > All this should be explained.
>=20
> Thank you for the feedback, what about rename to power-supply with regula=
tor support ?=20
> Convert this patch to add regulator support instead of GPIO, using "power=
-supply" property to control=20
> LED power, or drop this patch and give up upstream, or what's the better =
=66rom your point of view?
> appreciate your guidance!

Does it solve your problem? It is surprising that once you say it is
GPIO and once as regulator. How is it in your board?

Regulator is looking as correct hardware description, so that patch
would be fine.

Best regards,
Krzysztof


