Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A476C79EB
	for <lists+linux-leds@lfdr.de>; Fri, 24 Mar 2023 09:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCXIgJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Mar 2023 04:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXIgI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Mar 2023 04:36:08 -0400
X-Greylist: delayed 164 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Mar 2023 01:36:07 PDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1D05B81
        for <linux-leds@vger.kernel.org>; Fri, 24 Mar 2023 01:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679646783; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eETU9qr+Y+L0nQQIKPouZfVaSOJkOtlvxh9Zb/Fl5oMjKTKTgyenmkaPjJMMYloVjb
    IeCvbAx7WXidXzv8LhMPa0YbKHcxUWVg/lEUs8/C8VNruPxHgxjT46jrXUu3EhmV3olq
    4R83+q/QcB6K28g78JLcSbXZtJwuAMVRTQVyOjyCqF2+BDXfIghh1z5S6jh0pdA0AlNY
    gox2Hq0ocanSwfBm/VEBOyoL9nNPojrSwnSeOCUFWO4AcqC2F5SVA4E/90j23zAOIGYd
    NviQX3a4RGgHpHCKrGO7GHKEvVRpiN7116CRV8oKeCnmrc1/yvIPne2+4i6aGqtS2WsV
    aDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1679646783;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4iK4gU/6/b49QNadUtkOqzRxf2qaxC3/LHnMq2PLms8=;
    b=k1c+yZaYOWAYzETAKKAQeeeLX4+7acUNSvWkRmAfteC84avgJwFKFjVyw9fDvYiW7c
    drGdG0wS6T0eILo9dpyZylFtCNJ/S0c/+O1+ADLz2tiruu6nzKS59bduUvXqeOtBJRTZ
    kIIqYQ4hPKBVEV1HaLaegppQtiTN1GnXOS7iHoulvRCAzKHUPMSJIgpYTsxKHfqj4gF1
    QMZ9HF0gF637otJAF+T3/h/GUFleMeqLWQl/0FFiF1Xl1/uuBvy4bQJpa84HpPGjBYk3
    1xTs3/CofVO9Rhog/XiSBQu0MPWfqaZt/ZXgpEp8xsd5sI/eE1M2PLKQOfmrgkUTaD1u
    HsWg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1679646783;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4iK4gU/6/b49QNadUtkOqzRxf2qaxC3/LHnMq2PLms8=;
    b=odWp6a20rvMLtJcq6mCDtZJJ3TBFh1jsNg6Ndjj9ceeHBi/7nIJQjEjYaCTRyTfap3
    3/J7TDSt2z+bgIeM0XpXcU0Y9qzjxs8Ue1Mzu8l5gpxRdicmv7qMYd2gG/Oc7RWCmQ4j
    aq6AEX16QMrePcmOuOVxjbAVGRd3TSlUEm3SPeNMdV1QxU1+oWF8ZN08YnDYBDx2/NgD
    kmzL7oEwC99MMlhIDFtgczE8jT9nlrWgMpupfObUX7OkhZip4MYJrfRH1ZRxF2gtL6sp
    E1XXKCQRCkBs1+5U0PK1zP0vaCq0yGQWA7I6Qb9Tx8GAZQa39k5XvCTL4/HQubjHjkxs
    COLg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4obTF5+XzXE="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.3.1 DYNA|AUTH)
    with ESMTPSA id i40d22z2O8X2PmQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 24 Mar 2023 09:33:02 +0100 (CET)
Date:   Fri, 24 Mar 2023 09:32:52 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] leds: aw2013: Add vddio regulator
Message-ID: <ZB1gNJBFeFSdagF1@gerhold.net>
References: <20230320174949.174600-1-linmengbo0689@protonmail.com>
 <20230320175150.174711-1-linmengbo0689@protonmail.com>
 <ZByp5gzspOVcYyah@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZByp5gzspOVcYyah@duo.ucw.cz>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Thu, Mar 23, 2023 at 08:35:02PM +0100, Pavel Machek wrote:
> > Some LEDs controllers are used with external pull-up for the interrupt
> > line and the I2C lines, so we might need to enable a regulator to bring
> > the lines into usable state. Otherwise, this might cause spurious
> > interrupts and reading from I2C will fail.
> > 
> > Implement support for "vddio-supply" that is enabled by the aw2013 driver
> > so that the regulator gets enabled when needed.
> > 
> > Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> 
> > @@ -348,16 +350,20 @@ static int aw2013_probe(struct i2c_client *client)
> >  		goto error;
> >  	}
> >  
> > -	chip->vcc_regulator = devm_regulator_get(&client->dev, "vcc");
> > -	ret = PTR_ERR_OR_ZERO(chip->vcc_regulator);
> > -	if (ret) {
> > +	chip->regulators[0].supply = "vcc";
> > +	chip->regulators[1].supply = "vddio";
> > +	ret = devm_regulator_bulk_get(&client->dev,
> > +				      ARRAY_SIZE(chip->regulators),
> > +				      chip->regulators);
> > +	if (ret < 0) {
> >  		if (ret != -EPROBE_DEFER)
> >  			dev_err(&client->dev,
> >  				"Failed to request regulator: %d\n", ret);
> >  		goto error;
> 
> Won't this cause failures when optional vddio is unavailable?
> 

The regulator core should print a warning "supply vddio not found, using
dummy regulator" but then proceed normally.

I think in almost all cases a separate I/O supply should actually exist
that could be described in the device tree. It was likely just omitted
because it's always-on or indirectly being enabled by other devices.
So perhaps having this warning is even a good thing?

Thanks,
Stephan
