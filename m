Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BBA152FE
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 19:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfEFRob (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 13:44:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbfEFRob (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 May 2019 13:44:31 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7BE320B7C;
        Mon,  6 May 2019 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557164670;
        bh=FjPHioywBD1RQcEUs+vkS7eFM6aRa/+LWtdHsHtItOA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JG/BNZsRQv4furmZwUj/buubC8bARd1+lRZtO983CWusJclOgnlHNNRENOBo4TJqw
         huxEgf0Tnd1xv9VUiVJ+bkxNpVGRbXX5MWaXJ9CEbNjiBS9jq9N/1hO87o3jhgn3O3
         X+qsHJ9Nm1TjqTJqKinNSHBjVfrYvUGMs/f1NXdM=
Received: by mail-qt1-f180.google.com with SMTP id t1so15035479qtc.12;
        Mon, 06 May 2019 10:44:30 -0700 (PDT)
X-Gm-Message-State: APjAAAUFcTMuKsjRKA84fBzvhRPJanbj3WhVkkj3+bTnZvy687J3lY1Z
        wg7gjE4cQO/cf31FlrKAqMI3F8ESk73vyZ7T1A==
X-Google-Smtp-Source: APXvYqxnbA+v6YC6RhzdoizzdiGEQT8tfZkHtrk/yG7J31NEHra2ZTqL73ZyJzQWmj6OgDUyPySPck8yaFObjYeyXjQ=
X-Received: by 2002:a0c:d2f2:: with SMTP id x47mr21844351qvh.90.1557164669966;
 Mon, 06 May 2019 10:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190505200022.32209-1-oss@c-mauderer.de> <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
In-Reply-To: <20190506162848.GA9522@amd>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 May 2019 12:44:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
Message-ID: <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     oss@c-mauderer.de,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 6, 2019 at 11:28 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > +* Single Byte SPI LED Device Driver.
> > > +
> > > +The driver can be used for controllers with a very simple SPI protocol: Only one
> > > +byte will be sent. The value of the byte can be any value between the off-value
> > > +and max-value defined in the properties.
> > > +
> > > +One example where the driver can be used is the controller in Ubiquiti airCube
> > > +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
> > > +8F26E611LA) that has been programmed to control the single LED of the device.
> >
> > What about power control of the uC?
> >
> > > +The controller supports four modes depending on the highest two bits in a byte:
> > > +One setting for brightness, the other three provide different blink patterns.
> >
> > This part seems in no way generic.
> >
> > How does one support the blink patterns?
> >
> > > +With the leds-spi-byte driver a basic support for the brightness mode of that
> > > +controller can be easily achieved by setting the minimum and maximum to the
> > > +brightness modes minimum and maximum byte value.
> > > +
> > > +Required properties:
> > > +- compatible:          Should be "leds-spi-byte".
> >
> > Generally, we don't do "generic" bindings like this. The exceptions
> > are either we have confidence they really can be generic or they where
> > created before we knew better. A sample size of 1 doesn't convince me
> > the former is true.
> >
> > This comment *only* applies to the binding, not the driver. Specific
> > bindings can easily be bound to generic drivers.
>
> Ok, I'm afraid I caused this. What should the compatible be, then?

Knowing nothing about the h/w other than the above description:
ubiquiti,aircube-leds

Not sure if that's a registered or correct vendor prefix though.

Rob
