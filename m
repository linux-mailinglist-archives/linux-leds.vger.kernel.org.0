Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5242716D4
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 20:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgITSJk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 14:09:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:32789 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgITSJj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 14:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600625378;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FR8RvQi3cEt2WptbzKpJuw6Z6/ikuWmRCkVwx8lqScA=;
        b=QQL/wAnxrv0JGtNWivmzY/SaR9wsynKZzpbLBh4CBqFxD+KTVR8OaxliqFgIx/4A4Q
        nYnCRzai3Ux/s24ZDG+YHhOFg239d85PYirUXRSi4VTIecLgLoUD80KU0UbhsKLk+soQ
        txHKBLUVAiUAfTi7Cj/LWZn4z5RWRNHaxiGl1TfarK8/YjIRMWdUoVB2xjvd+pTunEG4
        XGvMMxSOg2o8g6KeSs5JR9lNUlB8AguPImWoblUR2iczE7ymnb9G6JaARXA2XVnVbyMC
        9bpklj5hMf6/GuoCA5Bwcm+Nt890hRqpNBUIQrB5uUvmD/OI4NagczWr8+NwpwN0icYj
        6i3w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAhw47vfM4="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw8KI9PFlF
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 20 Sep 2020 20:09:25 +0200 (CEST)
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API instead of OF
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200920193953.3eccaf31@nic.cz>
Date:   Sun, 20 Sep 2020 20:09:24 +0200
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ACF08157-2DD4-4135-8761-6D9D29B53FA4@goldelico.com>
References: <20200919221548.29984-1-marek.behun@nic.cz> <20200919221548.29984-3-marek.behun@nic.cz> <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com> <20200920193503.735bc66c@nic.cz> <20200920193953.3eccaf31@nic.cz>
To:     Marek Behun <marek.behun@nic.cz>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


> Am 20.09.2020 um 19:39 schrieb Marek Behun <marek.behun@nic.cz>:
>=20
> On Sun, 20 Sep 2020 19:35:03 +0200
> Marek Behun <marek.behun@nic.cz> wrote:
>=20
>> On Sun, 20 Sep 2020 19:10:19 +0200
>> H. Nikolaus Schaller <hns@goldelico.com> wrote:
>>=20
>>> I wanted to test, but was not able to git am this patch to my =
working
>>> environment (v5.9-rc5 or linux-next). So maybe some prerequisite is =
missing.
>>=20
>> Could you try applying on Pavel's for-next?
>>=20
>> =
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?=
h=3Dfor-next
>>=20
>> Marek
>=20
> Or even better, could you try my branch leds-cleanup-for-pavel? This =
is
> applied on top of Pavel's for-next branch.
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=3Dl=
eds-cleanup-for-pavel

Ok, seems to depend on:

leds: various: use only available OF children
leds: various: use dev_of_node(dev) instead of dev->of_node

Will try tomorrow.

BR and thanks,
Nikolaus

