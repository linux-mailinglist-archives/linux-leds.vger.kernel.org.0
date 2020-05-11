Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2691CE4EF
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 22:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbgEKUB4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 16:01:56 -0400
Received: from mail.nic.cz ([217.31.204.67]:35230 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgEKUB4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 May 2020 16:01:56 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 5251B140BC1;
        Mon, 11 May 2020 22:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1589227312; bh=G1i4RlD1KQ7SE6SG1r4ZvNUCjO6vFfHPemGroJMPjAQ=;
        h=Date:From:To;
        b=dXNaa0/eoQ3lC8U6veU4gafPVVc4gFJjHsqH+Q/noVJBHv7E/xoGiI/0wD2UPxFxV
         eIYiAZqW6kG4iV2H3BmXwkOzohcMxl6MgTispZsX6oZQOeG2s2KzEGL0hPHhACXE3H
         fl5ASopLjJA1AG6rO9I/t4grdgOwQK77XnXhd4Z0=
Date:   Mon, 11 May 2020 22:01:51 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200511220151.24985832@nic.cz>
In-Reply-To: <20200511194354.GA15606@bogus>
References: <20200423065100.2652-1-marek.behun@nic.cz>
        <20200423065100.2652-2-marek.behun@nic.cz>
        <20200511194354.GA15606@bogus>
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

On Mon, 11 May 2020 14:43:54 -0500
Rob Herring <robh@kernel.org> wrote:

> On Thu, Apr 23, 2020 at 08:50:59AM +0200, Marek Beh=C3=BAn wrote:
> > Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> >=20
> > ...
> >
> > +properties:
> > +  compatible:
> > +    const: cznic,turris-omnia-leds
> > +
> > +  reg:
> > +    description: I2C slave address of the microcontroller.
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^led[0-9][0-9]?$": =20
>=20
> 'led-' is preferred. And numbering is usually hex.
>
> What's the numbering here based on? Might be better to use 'reg' (and a=20
> unit-address) rather than led-sources. led-sources was for cases where=20
> the control interface (defined by reg) could have differing regulators=20
> connected to the LEDs.

Jacek, Pavel, it seems that it would be better if I just rewrote the
driver into Dan's multicolor API. It would solve Rob's complaint and
could be merged once multicolor framework is...

Marek
