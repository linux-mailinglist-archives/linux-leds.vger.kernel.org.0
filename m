Return-Path: <linux-leds+bounces-1604-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 033528BCA24
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 10:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8851F22C13
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EA81422A3;
	Mon,  6 May 2024 08:59:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692041420B9;
	Mon,  6 May 2024 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985979; cv=none; b=oVHYNSplVGKgmMb1mA52sULnZbzOQXrNXgPRvvISdVUkebPXhaChi0eEpGcHzekOTLFZ50Bc2s5+M135mF4394mLwJz+b7bBcnYo91YMF8MYXFtelFXT2+JYLTX4hpo3DYlvH6oIYZ3E5v7QS+d7DzL10s5MOpdH1hZW+5S0Ddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985979; c=relaxed/simple;
	bh=Ip4PJGmssqUYDHs84SW1KF6dPBdDymkhSRWjUmFmSZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXn3lELLSg7tTznhYzYiG246oD61Ppe9Kem6biZo/2gPpOQ3XglDnTHEKBGQvoGkbYqpHR/TkLkuvz+mCgmUkbh8aHCmTmK04FHy9h7wMFKj0EggjV+bT9oyg9m0jMne9+HyYWyIXKXAfxFBwhJniZg6OjFiDEL8gqqMgP/bX/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s3uC1-0000000057d-1grd;
	Mon, 06 May 2024 08:59:29 +0000
Date: Mon, 6 May 2024 09:59:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
Message-ID: <Zjib7STAHIikWnLp@makrotopia.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-2-linux@fw-web.de>
 <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>

On Mon, May 06, 2024 at 10:18:09AM +0200, Krzysztof Kozlowski wrote:
> On 05/05/2024 18:45, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
> > binding.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index 8a3c2398b10c..bf9a101e4d42 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -113,6 +113,8 @@ properties:
> >              # LED indicates NAND memory activity (deprecated),
> >              # in new implementations use "mtd"
> >            - nand-disk
> > +            # LED indicates network activity
> > +          - netdev
> 
> "dev" is redundant (there is no flash-dev or usb-host-dev). Two network
> interfaces are already provided, so your commit msg must provide
> rationale why this is not enough and why this is useful/needed.

Also note that using 'netdev' assigned via DT via linux,default-trigger
currently doesn't work well. This is because the assignment of the trigger
from DT happens when the PHY is being attached initially, and that's
**before** the network device is registered with Linux.
As a result, LED event offloading is never used if done in this way.

I know that bindings and implementation are two different independent
things, but yet I believe that adding bindings for a feature which doesn't
really work would be misleading.

