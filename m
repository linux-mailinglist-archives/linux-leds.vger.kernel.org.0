Return-Path: <linux-leds+bounces-3919-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA347A3084C
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 11:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2833A22F4
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 10:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465D11F3FC2;
	Tue, 11 Feb 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niY7Y5B1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537A26BDA9;
	Tue, 11 Feb 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269085; cv=none; b=FrNmjoLUJFZagcL4dfjDvo57QknTi5pU+DR5e3yWrhGyafAqme4oxcA6r+IPdJ54j5s+hQd5VNx4Arm5YfvDKGMzcDfOMDDDq022bieJYh2O2Qz0pKIBBR1y7dBU/7/S+5VzXe1Z/MCfrynLpykzftymfsl1fpebRi8p9r7kgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269085; c=relaxed/simple;
	bh=C7gEjp+CjZWa+7yzfzimjm9DA63+y5YVtzHT4iSZrPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A77Qt6OP47mYkUGSDq2A26Lx2EaOm68r3qlqYeHfuPkEGwI54c4WfmkwRpQscOeQHmb2LBDRCIe85pAoMCV2oumSQDqWoIleoxRTcQjHvnuhdkeQH1ErnoABJ1X5bK329voR/ZSw2apZpK6O36Rz1JouZSiT/shLOyOyYyuYaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niY7Y5B1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B06FC4CEDD;
	Tue, 11 Feb 2025 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739269084;
	bh=C7gEjp+CjZWa+7yzfzimjm9DA63+y5YVtzHT4iSZrPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niY7Y5B1lrSfqvBiu0gXX9813HxxvRkt5Di1twX0SQZgC0eG2shafCuFDdWip2UiT
	 vjjWnnpmlSZHmggTvfMQIjM0K7MUnuBgUgsC3XQFz1rWqMwGfbYPhvaPDmhd1C4ewN
	 x52EChzmuTwR9IPJkI5qORB56udK05ktgUuRx20TRh42WFk5naETBvaRLgTeHtVDrv
	 cIE8KPSyplCtZxoCVF9MV9dy0OKfLCxA4Sf7Gozhw5n0NsemR0zNYPtdbbPhLkbZGR
	 oFOP3gfr0oyKORaeSEqsiPh1YRZElygz9Qfi5xuNRRuECEjh354PPAm7+bw8EGIyNH
	 KJ3/x2aFvc1Vg==
Date: Tue, 11 Feb 2025 10:17:59 +0000
From: Lee Jones <lee@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to
 yaml format
Message-ID: <20250211101759.GM1868108@google.com>
References: <20250107161628.121685-1-Frank.Li@nxp.com>
 <173627580718.1304322.7908676202048945270.robh@kernel.org>
 <Z6pqnw3WBP7WRfYe@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6pqnw3WBP7WRfYe@lizhi-Precision-Tower-5810>

On Mon, 10 Feb 2025, Frank Li wrote:

> On Tue, Jan 07, 2025 at 12:50:07PM -0600, Rob Herring (Arm) wrote:
> >
> > On Tue, 07 Jan 2025 11:16:26 -0500, Frank Li wrote:
> > > Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
> > > warning.
> > >
> > > arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
> > >   /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> > >
> > > Additional change:
> > > - ref to common.yaml for child nodes.
> > > - limit child's reg to 0 - 7 for ti,tlc59108.
> > > - fix typo 'linux,default_trigger' in example.
> > > - change child node name's prefix to led-.
> > > - change nodename to led-controller.
> > > - fix properties order in example.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change from v1 to v2
> > > - using "^led@[0-9a-f]$"
> > > - remove minimum: 0
> > > ---
> > >  .../bindings/leds/leds-tlc591xx.txt           | 40 ---------
> > >  .../devicetree/bindings/leds/ti,tlc59116.yaml | 90 +++++++++++++++++++
> > >  2 files changed, 90 insertions(+), 40 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> > >
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Anyone take care this patch. Rob already acked.

Yes.  I'm working through my inbox now.  FWIW, since I work in reverse
chronological order, you just bumped it to the back of the queue.

-- 
Lee Jones [李琼斯]

