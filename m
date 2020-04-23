Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6DD1B54CD
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 08:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgDWGks (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 02:40:48 -0400
Received: from mail.nic.cz ([217.31.204.67]:45872 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgDWGks (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 02:40:48 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id A6CED140BD3;
        Thu, 23 Apr 2020 08:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587624046; bh=LkuL42hXPzC0mMIZfKgl4PYGmSs0s6vQivfcRSS78lo=;
        h=Date:From:To;
        b=ZnFUveIVQj8s79JTSSHlALtpN7XAKdI5+MuUx/4RJi/6B/3nrYbTFIgN3ePd3G7P7
         9LQOR0cbP/3iE+igOHaiNEzmmtDJ1O1/WvOetQsjGSTR+7sqNTR2VFn7Qz0wPlDlzx
         jB52RXW5L17VXcH8h+3uO9105wryr6qOS2F+9YfI=
Date:   Thu, 23 Apr 2020 08:40:46 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200423084046.453262a9@nic.cz>
In-Reply-To: <20200423063552.GA22554@amd>
References: <20200421171732.8277-1-marek.behun@nic.cz>
        <20200421171732.8277-2-marek.behun@nic.cz>
        <20200423063552.GA22554@amd>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020 08:35:52 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org> =20
>=20
> Rob already reviewed this one. Is there reason not to have his
> reviewed-by here?

This one is written in yaml, the previous was .txt

> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2019032819=
3428.19273-3-marek.behun@nic.cz/
>=20
> >  MAINTAINERS                                   |   5 +- =20
>=20
> Please put MAINTAINERS change into separate patch. I don't think I can
> merge it throught the LEDs tree.

Ok, I shall send it to someone else then, probably Gregory.
