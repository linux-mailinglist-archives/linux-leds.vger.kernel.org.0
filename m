Return-Path: <linux-leds+bounces-2107-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07F914EFA
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 15:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D602819CF
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62DA13DBAD;
	Mon, 24 Jun 2024 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="aSk3bRBf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58581E4A9
	for <linux-leds@vger.kernel.org>; Mon, 24 Jun 2024 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236657; cv=none; b=uyi2DcwJS5loyf9JddSfeeMp8YPEA+7IgZC4oqj4+10yE7C2PoaTB/iU84LUDO2TLMLpPLIqQlDpqppszmZvLVkzKYSOOoqUyaSVmTeD+ksogNHqJXT0HrZnbAZFAIHj4maBz19VYCQ/lilW45SIkdS0slD70RUf7piu2g9sYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236657; c=relaxed/simple;
	bh=ELaIEG74MklaoJDNNoPT1A/8G8fipu+VAEIFwgAMT6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpvls9M8AnqPrXF/dvdfIutDpH8Zl4f/Nmkpb992QD+Ej7niRh1sjYzxUadY3/3Mj2vU6InVjYPGXtAbt3vhClxbcP0ZUpy6s1tmKQBfrlD5V82iJOuL0ZvIPAHXgkl1Xhtlr5Z/UEeCCdyhpmfatDNajsetTiRuVv0xCNXVvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=aSk3bRBf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a72585032f1so104456566b.3
        for <linux-leds@vger.kernel.org>; Mon, 24 Jun 2024 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1719236654; x=1719841454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCJM0JyjwJh46dft1tKOFmyjfIFKbxwXPC+ayLJnOKI=;
        b=aSk3bRBfzYnNq+xSFc9npfY2DZTuSZN0PyNgEGejfz258JlZfExTB699ij4yZGdFzN
         9JwIy3PiXLo7V4taVKaYpifI0MZdAXo/zYeDVMGtzD0GzHOLTDGqDFThHCiul1GOntWv
         E3Uexe3cSisBYsiF8GDC3Y9IXakV1JzrOxT6ItDiN4MGUZPflmd2EjwQg99mvBNKjI0B
         GIY8BnhFGwF08V91/2WC9eAQmxg7lHmzH5NaCaqA1XfUg7Q0I9QWHXSPeMUvJcP21DN5
         70BBadWB3cKvxHMH7nd/CH1BLR+8l/aCTudjy9EjX+vc32tjAXRVHxTrFwNu2b6coJqD
         wRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719236654; x=1719841454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCJM0JyjwJh46dft1tKOFmyjfIFKbxwXPC+ayLJnOKI=;
        b=PJR84/6Qik3cBlBMlmUtVS6fzK+mp0+bgcMjmWqcsJFWY3Ip3/BFiQ+wq9YgsY+4F/
         xmfJDhB28n8bGzKGk1GNXR5pWPslym8JCiKUbTC7kQjWkGKkmVYmTBb3RgwcOqrDc7ur
         2y4gnVyvJE+QRskCNx4GtUV4GXkmq6rEMCFpuD1ci4PeXoPfNfXN7gEWwKmCwTxmIFai
         Bxd3QbSNLrOiPV+9Du32E9Dt7wo9yc6t82AMQrWBYUAKnOt5dARs2dRPar1RfXH28zt7
         Qv/Ixwq9xlL7JZWAn5l3wlfH1ktNRbtaKEAGQdzoPpOIi6lrXaEIa8Jtit1zBYvEjNdD
         25Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUKQ++OmtoB7ErtDPTi4WK9avidO561rtP6UQq67Bb5HP3n9pJWPVKGz+oSQq21ltMf9IHVyAiEL6SQDHsaL91Q6VCYK6SGvdYwAw==
X-Gm-Message-State: AOJu0YzibqQp4O8eip7/tNoSN5aLlx7bg5uw+Q9Dh75ZUiLYF3HuQ5Yk
	gbYABRVJG8bwHPUkUaPHLRu6K+CKZI1F7e7+k3KrUSpkvNPFM6265mx7u2TdRWg7B6gTAFtnCUz
	FeufgSarmB3gC8/NT/LkJDZfFDF8YEwTOhryrmN9w//hy2GUxyolKWeVElRNUav1HOAA7UjSUxZ
	QJJC76TiGLeqm3ayHk06A9MvZ0
X-Google-Smtp-Source: AGHT+IHPJaWD1ujxrcdnkDisRugDbHGYl6lNKmXKtHZfVumDEr+NmD309KmEmdd2LlDRmGBPipI8lw==
X-Received: by 2002:a17:906:28c7:b0:a6f:d5b:20c3 with SMTP id a640c23a62f3a-a716556d52bmr340008566b.74.1719236653935;
        Mon, 24 Jun 2024 06:44:13 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:f136:1973:486:27b7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724ebbc1a5sm155566266b.213.2024.06.24.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:44:13 -0700 (PDT)
Date: Mon, 24 Jun 2024 15:44:07 +0200
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <Znl4J6FRw9ygmIJX@admins-Air>
References: <ZniNdGgKyUMV-hjq@admins-Air>
 <7a080980-a247-4d17-88f7-19899379e1a1@kernel.org>
 <ZnlvOuvMQmJFrfSX@admins-Air>
 <2b01874f-26e9-41a1-84c0-9a2ed15cb630@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b01874f-26e9-41a1-84c0-9a2ed15cb630@kernel.org>

On Mon, Jun 24, 2024 at 03:08:56PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2024 15:06, Vicentiu Galanopulo wrote:
> > On Mon, Jun 24, 2024 at 07:02:12AM +0200, Krzysztof Kozlowski wrote:
> >> On 23/06/2024 23:02, Vicentiu Galanopulo wrote:
> >>> The LED1202 is a 12-channel low quiescent current LED driver with:
> >>>   * Supply range from 2.6 V to 5 V
> >>>   * 20 mA current capability per channel
> >>>   * 1.8 V compatible I2C control interface
> >>>   * 8-bit analog dimming individual control
> >>>   * 12-bit local PWM resolution
> >>>   * 8 programmable patterns
> >>>
> >>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> >>> ---
> >>>
> >>> Changes in v2:
> >>>   - renamed label to remove color from it
> >>>   - add color property for each node
> >>>   - add function and function-enumerator property for each node
> >>
> >> Fix your email setup, because your broken or non-existing threading
> >> messes with review process. See:
> >>
> >> b4 diff '<ZniNdGgKyUMV-hjq@admins-Air>'
> >> Grabbing thread from
> >> lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/t.mbox.gz
> >> Checking for older revisions
> >> Grabbing search results from lore.kernel.org
> >>   Added from v1: 1 patches
> >> ---
> >> Analyzing 3 messages in the thread
> >> Looking for additional code-review trailers on lore.kernel.org
> >> Preparing fake-am for v1: dt-bindings: leds: Add LED1202 LED Controller
> >> ERROR: v1 series incomplete; unable to create a fake-am range
> >> ---
> >> Could not create fake-am range for lower series v1
> >>
> >>
> >>>
> >>>  .../devicetree/bindings/leds/st,led1202.yml   | 162 ++++++++++++++++++
> >>>  1 file changed, 162 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml
> >>
> >> yaml, not yml
> > ok, will change
> >>
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yml b/Documentation/devicetree/bindings/leds/st,led1202.yml
> >>> new file mode 100644
> >>> index 000000000000..1484b09c8eeb
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/leds/st,led1202.yml
> >>> @@ -0,0 +1,162 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: ST LED1202 LED controllers
> >>> +
> >>> +maintainers:
> >>> +  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> >>> +
> >>> +description:
> >>> +  The LED1202 is a 12-channel low quiescent current LED controller
> >>> +  programmable via I2C; The output current can be adjusted separately
> >>> +  for each channel by 8-bit analog and 12-bit digital dimming control.
> >>> +
> >>> +  Datasheet available at
> >>> +  https://www.st.com/en/power-management/led1202.html
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - st,led1202
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  "#address-cells":
> >>> +    const: 1
> >>> +
> >>> +  "#size-cells":
> >>> +    const: 0
> >>> +
> >>> +patternProperties:
> >>> +  "^led@[0-9a-f]+$":
> >>> +    type: object
> >>> +    $ref: common.yaml#
> >>> +    unevaluatedProperties: false
> >>> +
> >>> +    properties:
> >>> +      reg:
> >>> +        minimum: 0
> >>> +        maximum: 11
> >>> +
> >>> +    required:
> >>> +      - reg
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/leds/common.h>
> >>> +
> >>> +    i2c {
> >>> +        #address-cells = <1>;
> >>> +        #size-cells = <0>;
> >>> +
> >>> +        led-controller@58 {
> >>> +            compatible = "st,led1202";
> >>> +            reg = <0x58>;
> >>> +            address-cells = <1>;
> >>> +            size-cells = <0>;
> >>> +
> >>> +            led@0 {
> >>> +                reg = <0>;
> >>> +                label = "led1";
> >>> +                function = LED_FUNCTION_STATUS;
> >>> +                color = <LED_COLOR_ID_RED>;
> >>> +                function-enumerator = <1>;
> >>> +                active = <1>;
> >>
> >> This did not improve. First, which binding defines this field?
> >>
> > it's a new field I added, but if you would like for me to use another
> > please advise.
> 
> Look at the LED bindings. Anyway, you cannot sprinkle new properties to
> some nodes without defining them in the bindings.
>
Ok, will do
 
> > Depending on this value, the enabled/disabled bit is set in the
> > appropriate register, and the led appears with the label name in sysfs.
> > Hope this extra info helps in helping me pick the appropiate binding. 
> > 
> >> Second this was never tested.
> >>
> > are you referring to the automated test done by the kernel test robot?
> 
> No, your testing. See writing-schema doc.
> 
Thanks for pointing this out, will look.
> > 
> >  
> >> Third, where did you give me any chance to reply to your comment before
> >> posting new version?
> >>
> > I think I have a wrong understanding of the process or mutt client is missconfigured
> > or missued on my side.
> 
> Sending new version of patchset without allowing me to respond is not
> "mutt misconfiguration".
> 
I'm insisting with this just to be sure that I'm not using mutt any other way than
I should. I've configured threading, but I don't know how it shows on your end.
So:
I've sent v1 -> you said change color and function and asked about active ->
I've send v2 with color and function *changed*, and contiuned the conversation in the
 email thread about active.

Expectation was that the active stuff was to be decided and then a v2 should
have comed from me?

If yes, this is the "process" part I was previously referring to, that I don't know.
From my point of view, the outcome is the same, function and color needed to be changed anyway. 

> Best regards,
> Krzysztof
> 

Kind regards,
Vicentiu

