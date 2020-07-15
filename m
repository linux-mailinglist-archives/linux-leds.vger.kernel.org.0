Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB56220DFC
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbgGONU7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:20:59 -0400
Received: from lists.nic.cz ([217.31.204.67]:41476 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731457AbgGONU7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 09:20:59 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 23DFE140968;
        Wed, 15 Jul 2020 15:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594819257; bh=MKsvJ3WgdNJPCd+vYDcqNV2g9WbIM7ygtB7ybQlAeGg=;
        h=Date:From:To;
        b=buUx2qThhjCdZvYwBpaAxEmBrBDfZ0JHSadLQM+bbzyKduMOAIOCzMwVNzyTsGBiA
         V2+/pF35hTi03NUCdMfplsTCIy8R+1YwIJVZYpDK1ena10vEtRvHDPCJ5fJ0ktMQIz
         IfhIggfK92O0z1o9+9y9x6Fq1RKANd9EYrfGErqY=
Date:   Wed, 15 Jul 2020 15:20:56 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v30 04/16] leds: Add multicolor ID to the color ID list
Message-ID: <20200715152056.3505e181@dellmb.labs.office.nic.cz>
In-Reply-To: <20200713154544.1683-5-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
        <20200713154544.1683-5-dmurphy@ti.com>
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

On Mon, 13 Jul 2020 10:45:32 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Add a new color ID that is declared as MULTICOLOR as with the
> multicolor framework declaring a definitive color is not accurate
> as the node can contain multiple colors.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/led-core.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
