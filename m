Return-Path: <linux-leds+bounces-5381-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E5B42DBB
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 01:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF075567D91
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 23:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0D2F6587;
	Wed,  3 Sep 2025 23:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="gXZ+AP05"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C752D7DC2;
	Wed,  3 Sep 2025 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756943791; cv=none; b=W+VYqp4u6He55PQ/fPdlteQoyN5bYwiyQ5+aj17nL1Gb9bHEzNnVSrm4Eo5AGmVeqmxTU4SBpBqsdMyvsYauvkuKCu2MkKwNwrNw5IfMhBxpxbxUY2+XjDieMQMHb9eLmmF6KNNNgH7iWpUXQP0rqoaXU70eyjBOV/n314A0sDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756943791; c=relaxed/simple;
	bh=D/mDCChrYqtDDtdXfScMQpY0yIpDjNoZE3g/ZJ+d2UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGPgSL/idoqNQXlnKz1V1ZgCBcVfbLzh36x3404Hqbt334leVbItsSb8oVmi8G8AN9eAqZUto9zWg4NcOlBOq5Myf9526qTg+bB3uFSfgcq1zmswdzNPHEtAlueoJoOhylG2tES9DKkw8AyYmytGbjq14OzuRY0tP1pNoYlr+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=gXZ+AP05; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1756943779; x=1757202979;
	bh=ntDpt7+HVnRWmi4X9YIRcXQEYGfUYQYmSHg1m3hbxyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gXZ+AP05Uflj/zoh/w6+7gVcu4keyIqogk4lcyVZiv+7gQZLpcFzApxG/KFVQL3xj
	 0urH8vRyzizckl3uDX8jJzPmF8R1sVaneg++vEiiNyj/+OqgNmQcmJ9Mzv2Lto8uit
	 Rh+vSFYEfKfOgKecClHigeXj9cuU5NbfxphXjxM8rjjNPy7+pRwmQsxlNNQL6o+rqh
	 cjWWgRNLmKdjEQuY/fvo9chwvp/3uMNw4252TGZ0WeYv2TCn0a9XvsUomfwDnwZxS9
	 HdSZVOc0TvlTMCS7gijOaoPmj867F/YvzRBeN0UF5jlRn/BWV7xog/chUosrGyUPNh
	 mnWxrZw0MY2Pw==
X-Pm-Submission-Id: 4cHKJK54ppz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
To: robh@kernel.org,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer documentation
Date: Thu,  4 Sep 2025 01:56:15 +0200
Message-ID: <20250903235615.134520-1-alex@vinarskis.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902182114.GA965402-robh@kernel.org>
References: <20250902182114.GA965402-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Tue, Sep 02, 2025 at 11:10:51AM +0000, Aleksandrs Vinarskis wrote:
> > Currently supports passing 'led-names' used to map LED devices to their
> > respective functions.
> > 
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a63e78417df84609e279835f7dae62e3ad2f0bf5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common leds consumer
> > +
> > +maintainers:
> > +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> > +
> > +description:
> > +  Some LED defined in DT are required by other DT consumers, for example
> > +  v4l2 subnode may require privacy or flash LED.
> > +
> > +  Document LED properties that its consumers may define.
> 
> We already have the trigger-source binding for "attaching" LEDs to 
> devices. Why does that not work here?

I have not actually considered this, as the existing privacy-led solution
from the original series is not trigger based. At least one of the reasons
for that is that trigger source can be rather easily altered from user
space, which would've been bad for this use case. If v4l2 acquires control
over the LED it actually removes triggers and disables sysfs on that LED.

Regarding DT check that is failing because 'ovti,ov02e10.yaml' does not
allow for additional properties - the same issue would apply to basically
any camera, I missed it. So would need to either include this new binding
in 'video-interface-devices.yaml', or drop new binding and directly include
these new generic LED related properties in the video one. However, in this
case it gets a bit ugly, as the latter already contains 'flash-leds' for
flash specifically, and we would be adding a more generic way only used for
privacy LED, at least for now... not too sure whats the best way here,
leaning towards 1st option.

Let me know what you think,

Alex


> 
> Rob
> 
> > +
> > +properties:
> > +  leds:
> > +    description:
> > +      Phandle to LED device(s) required by particular consumer.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +  led-names:
> > +    description:
> > +      List of device name(s). Used to map LED devices to their respective
> > +      functions, when consumer requires more than one LED.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      camera@36 {
> > +        compatible = "ovti,ov02c10";
> > +        reg = <0x36>;
> > +
> > +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&cam_rgb_default>;
> > +
> > +        led-names = "privacy-led";
> > +        leds = <&privacy_led>;
> > +
> > +        clocks = <&ov02e10_clk>;
> > +
> > +        assigned-clocks = <&ov02e10_clk>;
> > +        assigned-clock-rates = <19200000>;
> > +
> > +        avdd-supply = <&vreg_l7b_2p8>;
> > +        dvdd-supply = <&vreg_l7b_2p8>;
> > +        dovdd-supply = <&vreg_cam_1p8>;
> > +
> > +        port {
> > +          ov02e10_ep: endpoint {
> > +            data-lanes = <1 2>;
> > +            link-frequencies = /bits/ 64 <400000000>;
> > +            remote-endpoint = <&csiphy4_ep>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.48.1
> > 

