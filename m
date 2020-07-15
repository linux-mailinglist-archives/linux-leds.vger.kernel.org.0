Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24F62213CF
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 19:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgGORzZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 13:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgGORzZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 13:55:25 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DCDC061755;
        Wed, 15 Jul 2020 10:55:25 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 45215140968;
        Wed, 15 Jul 2020 19:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594835722; bh=7+9idVmjLR/tQkAJdiSW4x+SiZuCUKSlqB3cJYxNQh8=;
        h=Date:From:To;
        b=cH4CfOD91qVcGKacdO4AAbynkr+IuLHFqwAPS2nlXRgZOkqzKO8+tr5HK1PKIGyr/
         Z6ZX628VXkp2nNs4mk4/OhUeeGNYxnZkYE4+xeUbsfmddA3z3WYC4X9OIFCc+k21Im
         iZ1uFUxwmxqfHijcc5niHDgiwPNk1XiRK1lEWBgM=
Date:   Wed, 15 Jul 2020 19:55:21 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200715195521.330824f1@dellmb.labs.office.nic.cz>
In-Reply-To: <20200715190727.4bb528dc@dellmb.labs.office.nic.cz>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200711100409.GA18901@amd>
        <20200715190727.4bb528dc@dellmb.labs.office.nic.cz>
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

On Wed, 15 Jul 2020 19:07:27 +0200
Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:

> This should instead check:
>   the names are same and both trigger have the same type (either none
>   or same). In that case return -EEXIST.

My bad, this is of course wrong. -EEXIST should be returned if the
names are same and triggers have same type or one of them has no type.
