Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30D5274925
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgIVT36 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:29:58 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:13160 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVT35 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 15:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600802996;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p7agyfO5fITbZVQM9bntdEveQXTsxTKgpZ6BQMjAdmA=;
        b=iH2l28Ai+jNUYQGXghSlFL6vNUo1zbhEJ62fgYP3UfhdUpY+ZnhllU++lQx4hQhgo0
        nJHpzRE1TMvrTBlVlK3Ud2Pknd5i8J3CZS8d7vJjXpc9EpuyRnL9YF5kvOGdf+SZLMfm
        RJGoAhKnrO/peiTzoD5tr5U73XbAzZ5V4nY43CaN5Yov1MeOhdokBj960/Bq0pw/T3tY
        yV3MpBKnYe7zV+JdSERiawVeGyXvUd1/UgLaLHSYH+EIA5Z2KJej7981UzwlZ+/z5KnN
        eZbTHI0DG9d7AXW8/YQ4QrCHsUAzfAs2LGYFAyT9DscgIlpDRmJzFxTGpdJvh7XHEvr5
        K0SQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleUXA9h"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw8MJTePLh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 22 Sep 2020 21:29:40 +0200 (CEST)
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API instead of OF
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ACF08157-2DD4-4135-8761-6D9D29B53FA4@goldelico.com>
Date:   Tue, 22 Sep 2020 21:29:40 +0200
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF3EF225-9188-4225-A0D6-B748736CA68F@goldelico.com>
References: <20200919221548.29984-1-marek.behun@nic.cz> <20200919221548.29984-3-marek.behun@nic.cz> <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com> <20200920193503.735bc66c@nic.cz> <20200920193953.3eccaf31@nic.cz> <ACF08157-2DD4-4135-8761-6D9D29B53FA4@goldelico.com>
To:     Marek Behun <marek.behun@nic.cz>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


> Am 20.09.2020 um 20:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 20.09.2020 um 19:39 schrieb Marek Behun <marek.behun@nic.cz>:
>>=20
>> On Sun, 20 Sep 2020 19:35:03 +0200
>> Marek Behun <marek.behun@nic.cz> wrote:
>>=20
>>> On Sun, 20 Sep 2020 19:10:19 +0200
>>> H. Nikolaus Schaller <hns@goldelico.com> wrote:
>>>=20
>>>> I wanted to test, but was not able to git am this patch to my =
working
>>>> environment (v5.9-rc5 or linux-next). So maybe some prerequisite is =
missing.
>>>=20
>>> Could you try applying on Pavel's for-next?
>>>=20
>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?=
h=3Dfor-next
>>>=20
>>> Marek
>>=20
>> Or even better, could you try my branch leds-cleanup-for-pavel? This =
is
>> applied on top of Pavel's for-next branch.
>>=20
>> =
https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=3Dl=
eds-cleanup-for-pavel
>=20
> Ok, seems to depend on:
>=20
> leds: various: use only available OF children
> leds: various: use dev_of_node(dev) instead of dev->of_node
>=20
> Will try tomorrow.

Ok, I have not found a negative effect on GTA04...
Well, it only uses DT for ages.

BR,
Nikolaus=
