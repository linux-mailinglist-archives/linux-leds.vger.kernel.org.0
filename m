Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65BB347174
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 07:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhCXGP5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 02:15:57 -0400
Received: from mail.thorsis.com ([92.198.35.195]:60892 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233182AbhCXGP5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 02:15:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 9AA3D3242;
        Wed, 24 Mar 2021 07:15:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tl2f0L7LG2pZ; Wed, 24 Mar 2021 07:15:55 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id C67403374; Wed, 24 Mar 2021 07:15:53 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
Date:   Wed, 24 Mar 2021 07:15:47 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     Hermes Zhang <Hermes.Zhang@axis.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc:     kernel <kernel@axis.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <395366948.12083.1616566547773@seven.thorsis.com>
In-Reply-To: <cce4da5a92d9414e87b6ac6d1d167fac@XBOX01.axis.com>
References: <20210324024844.15796-1-chenhui.zhang@axis.com>
 <558944059.12080.1616565502073@seven.thorsis.com>
 <cce4da5a92d9414e87b6ac6d1d167fac@XBOX01.axis.com>
Subject: RE: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

> Hermes Zhang <hermes.zhang@axis.com> hat am 24.03.2021 07:04 geschrieben:
> 
>  
> > >
> > > Notes:
> > >     Add maxItems
> > 
> > What about the other part of the series? I think you should send both
> > patches together with an introduction message on both. If you only change
> > one patch for a new version spin of the series, just send the other one
> > unchanged.
> > 
> > (It makes no sense to merge the binding as long as the driver is not merged,
> > otherwise you would end up with a binding without driver. So keeping them
> > together should help reviewers and maintainers.)
> > 
> 
> Hi Alexander,
> 
> The other part is here: https://lore.kernel.org/patchwork/patch/1399875/, so do you mean I need to combine these two as one commit? Or is there anyway to link them together? Thanks.

Two commits.

For sending more than one patch in a series call `git format-patch` with the option --cover-letter. Please have a look at documentation on `git format-patch` and `git send-email` again.

You can see how it looks if you look out for other patch series on the from the past, especially those with subjects like "[PATCH 0/x] ...". An e-mail client supporting threaded view helps a lot.

> I'm first time to commit a new driver, sorry for that.

Thanks for trying. No need to be sorry, the tools are hard and expectations are high. In the end it's all about efficiency.

Have a nice day
Alex
