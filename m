Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5507E28A28B
	for <lists+linux-leds@lfdr.de>; Sun, 11 Oct 2020 00:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390587AbgJJW57 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Oct 2020 18:57:59 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:55788 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730712AbgJJV7j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 10 Oct 2020 17:59:39 -0400
Received: from in-6.websupport.sk (unknown [10.10.2.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 210E7BC7C9;
        Sat, 10 Oct 2020 23:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1602366646;
        bh=Rcvcih4uUfuaorbzYQBHE4U38YDqVRtN4zWeJo/aPfw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=bK6QIMBI0gw0BwL6dFD8g8a18M0G0P5hEQx3YQzzsvNxcAl337rx83Bk9ys4HUNkY
         YOsBiya9Yw1mUaea0wCn2HZU0P6KAhxovYFwPBK5FAsI3RO2PUoaeySWSxLsvlIFhh
         GpAfV9LwA6AaYYIGSft+sCeqeJsc98AQ5m+ZFhPk=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-6.websupport.sk (Postfix) with ESMTPSA id 4C7zC95bByz12MRx;
        Sat, 10 Oct 2020 23:50:45 +0200 (CEST)
Date:   Sat, 10 Oct 2020 23:50:45 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Gabriel David <ultracoolguy4@protonmail.com>, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lm3697: Rename struct into more appropriate
 name
Message-ID: <20201010235045.4ba8cf51@blackhole.sk>
In-Reply-To: <20201010185700.GA8218@amd>
References: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
        <20201010185700.GA8218@amd>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Out-Rspamd-Queue-Id: 4C7zC95bByz12MRx
Authentication-Results: in-6.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-6
X-Out-Spamd-Result: default: False [-2.10 / 1000.00];
         ARC_NA(0.00)[];
         GENERIC_REPUTATION(0.00)[-0.50211252601821];
         BAYES_HAM(-2.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[protonmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[5];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         FREEMAIL_CC(0.00)[protonmail.com,ti.com,vger.kernel.org];
         MID_RHS_MATCH_FROM(0.00)[]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 10 Oct 2020 20:57:00 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Fri 2020-10-09 15:51:35, Gabriel David wrote:
> > The mentioned struct, lm3697_led, was renamed to lm3697_bank since the
> > structure is representing the control banks. This name, in my opinion,
> > is more semantically correct. The pointers referring to it were also
> > renamed. =20
>=20
> > Signed-off-by: Gabriel David <ultracoolguy4@protonmail.com>
> > ---
> > Yes, this is the same Gabriel David from ultracoolguy@tutanota.org and
> > ultracoolguy@disroot.org. If you want me to confirm it I'll gladly do
> > it. =20
>=20
> No problem with that, and no need to resend. This can proably wait
> for 5.11...
>=20
> I'd like some comment from Dan... and perhaps I'd want to understand
> what the difference between LED and bank is.
>=20
> ...there can be more than one LED connected to the given bank, that's
> what you are pointing out?
>=20
> ...but these LEDs will always work in unison, and they are handled as
> single LED by Linux, right?
>=20

Pavel,

the controller can connect 3 LED strips (to 3 different pins on the
chip). There are 2 LED control banks (this is where you can set
brightness). For each LED strip (each output pin) you can configure to
which control bank it connects. So you have 3 LED strips and 2 control
banks, that is 2^3 =3D 8 different configurations of connecting LED
control bank to LED strip.

=46rom the perspective of Linux you see the two control banks as 2 LED
class devices (because you are setting brightness for control banks,
not for the LED strips).

Marek
