Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621AB220DF6
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbgGONUo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:20:44 -0400
Received: from lists.nic.cz ([217.31.204.67]:41386 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731457AbgGONUo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 09:20:44 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 2D862140968;
        Wed, 15 Jul 2020 15:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594819242; bh=OJGSnMnuLigyhZ0vOvJBhIa0tDbcEtM7CFv9CHE99m0=;
        h=Date:From:To;
        b=hnpTkao8b/RorXcj9I2ae4UcIToI6hbiGr9hvUT0aWG9bKMDMPhvn8VQYrAH2xJpF
         tkMpmJIZP6Jj7b7saWTR/4qcU1f6HLAuEFU8XoID8pk+DnpWToyRbotJoFko/8qoYi
         Cnwi+NWdCSL0zt+F6Nqh5V43jYsGFPqpqj5LssFM=
Date:   Wed, 15 Jul 2020 15:20:41 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v30 03/16] dt: bindings: Add multicolor class dt
 bindings documention
Message-ID: <20200715152041.203ebcf6@dellmb.labs.office.nic.cz>
In-Reply-To: <20200713154544.1683-4-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
        <20200713154544.1683-4-dmurphy@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Jul 2020 10:45:31 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
>=20
> CC: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.yaml  | 37
> +++++++++++++++++++ include/dt-bindings/leds/common.h             |
> 3 +- 2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644
> Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

Reviewed-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
