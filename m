Return-Path: <linux-leds+bounces-5383-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90782B432B0
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 08:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA393A741E
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 06:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7167B275B1F;
	Thu,  4 Sep 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4FHu9Fo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D2F21C9F9;
	Thu,  4 Sep 2025 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968088; cv=none; b=Svia2mY8l5rdx17t3fnd4wmoWJR7kwYE0NITIwYxPZ2G6yIzpYl4MTJNjeqoDLpCouWKeYKe9ASTuPaOG/WZHe1IjU2T7/wBBbZBBoOOezjLtZQO2i/ogfVk0mzLMKEylLzAzGleuq1dM0DAj4aFHaOGlPF/82MBP82tNAfcr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968088; c=relaxed/simple;
	bh=U4B61QoK2r4mgogUEGYi5eBvsr+AgbLckE9RxAwb2O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1cG62uq/nmfHUpOMY6BcGxQRxAXED1rS14JK+fAns5yckKoCe563TvCMAxXnL7/cS+6Tj7v304gQ5l3ztDL4KE7TWeHiP79lAwnBtc9Y2gxGs/PKDsdW/9sV8iV5AzCfEKLDsi72IFXZZ7X/y5wbABuqQmqoAtHD6rirGp2vrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4FHu9Fo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3234EC4CEF0;
	Thu,  4 Sep 2025 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756968087;
	bh=U4B61QoK2r4mgogUEGYi5eBvsr+AgbLckE9RxAwb2O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4FHu9Fobx8HemmN4ZPBJxpSX6Hi/kEypWrXHEl1k3spCd36WN5o1EG04ws/c3DwW
	 qMJHgJMvZe2icvDnT7ghYgFOxbWsGqcuOYaCH8FnhLWL/rc6n+uq+JpB90Xll8KFK9
	 E6JYYs7qhoCTHiMqCksGaV5Et7l77MeJMHcEFjqCDPCwNd6dsPBVjsl8HgYELMpvE4
	 eAp7vsvMXbAeMZwucVcsPEv+6oFVSG+qqkDiB7EoZ9uRa0hnUSAAkI0hJH4VSfLXc6
	 8/dd5L50fJacMnfuzLddMBaoS6JYs4Am9WE+RMqBTGBdr5l4E+FihBKMV02YeuHH1v
	 H6bV98qgZ2PqA==
Date: Thu, 4 Sep 2025 08:41:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: robh@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, hansg@kernel.org, krzk+dt@kernel.org, lee@kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250904-brave-zippy-quoll-fcb054@kuoka>
References: <20250902182114.GA965402-robh@kernel.org>
 <20250903235615.134520-1-alex@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903235615.134520-1-alex@vinarskis.com>

On Thu, Sep 04, 2025 at 01:56:15AM +0200, Aleksandrs Vinarskis wrote:
> > On Tue, Sep 02, 2025 at 11:10:51AM +0000, Aleksandrs Vinarskis wrote:
> > > Currently supports passing 'led-names' used to map LED devices to their
> > > respective functions.
> > > 
> > > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > > ---
> > >  .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a63e78417df84609e279835f7dae62e3ad2f0bf5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common leds consumer
> > > +
> > > +maintainers:
> > > +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> > > +
> > > +description:
> > > +  Some LED defined in DT are required by other DT consumers, for example
> > > +  v4l2 subnode may require privacy or flash LED.
> > > +
> > > +  Document LED properties that its consumers may define.
> > 
> > We already have the trigger-source binding for "attaching" LEDs to 
> > devices. Why does that not work here?
> 
> I have not actually considered this, as the existing privacy-led solution
> from the original series is not trigger based. At least one of the reasons
> for that is that trigger source can be rather easily altered from user
> space, which would've been bad for this use case. If v4l2 acquires control
> over the LED it actually removes triggers and disables sysfs on that LED.

So does that mean that v4l2 solves the problem of "trigger source can be
rather easily altered from user space"?

Best regards,
Krzysztof


