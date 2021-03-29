Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D52034C376
	for <lists+linux-leds@lfdr.de>; Mon, 29 Mar 2021 08:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhC2GAy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Mar 2021 02:00:54 -0400
Received: from smtp1.axis.com ([195.60.68.17]:65008 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhC2GAp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Mar 2021 02:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616997645;
  x=1648533645;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=vi4w4a4WomT2xgpiO19F6LjEaxN0GBysZtobwMDFqS4=;
  b=KGTy/rt7rQn7AG/E+rerZ9mHIo3NmYlTudXQfTZ+IA5jXT0hG6bgIEiK
   roFt8LUb8P3z384KCiq3Dc/ie6l0warTz17D9klUKLFC8oz+CUoKduuuM
   6VE8Kb7PXpczWJRCkb6k5ExD98qq4dbREvP2IhgDd5Kfj/WfUBCaVaZBp
   XlMszjO0wM4sEC5Rl0aIOHVca54IDHVV31uM1xxQZ84Ku8b8GfEe/1Pt7
   uDHlB13JuojrwrhqpOwnx6riTtwXIex0fzS2Ar68olaJ6Pcu2SRdpCKky
   mGatF5fRvdIZsHQj36DSJhRouOQu3UMCqbnB5Ky3pJGEneUZLnkOV9BrT
   w==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hermes Zhang <Hermes.Zhang@axis.com>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Thread-Topic: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Thread-Index: AQHXIgDn9WkVNzIcREGb9FBG0Jikcw==
Date:   Mon, 29 Mar 2021 06:00:43 +0000
Message-ID: <314085a9074c4c6db48a1460c42fb2cd@XBOX01.axis.com>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-3-chenhui.zhang@axis.com>
 <20210326134939.GA11578@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/26/21 9:49 PM, Pavel Machek wrote:=0A=
>> +	of_property_read_string(node, "default-state", &state);=0A=
>> +	if (!strcmp(state, "on"))=0A=
>> +		multi_gpio_led_set(&priv->cdev, priv->cdev.max_brightness);=0A=
>> +	else=0A=
>> +		multi_gpio_led_set(&priv->cdev, 0);=0A=
> No need for default-state handling, unless you are using it.=0A=
>=0A=
We will use it, to make the LED default on or off.=0A=
=0A=
=0A=
Best Regards,=0A=
=0A=
Hermes=0A=
=0A=
