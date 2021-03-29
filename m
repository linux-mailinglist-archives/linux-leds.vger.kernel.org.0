Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB4534C379
	for <lists+linux-leds@lfdr.de>; Mon, 29 Mar 2021 08:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhC2GDi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Mar 2021 02:03:38 -0400
Received: from smtp2.axis.com ([195.60.68.18]:45099 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhC2GDH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Mar 2021 02:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616997787;
  x=1648533787;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=6TtND9PQIr5Ym9feqaAO8smz4OK2c/OlqmLq061Vq+E=;
  b=XMW1i6Rof+UcYdL2aGtOerRDqu+wfnC7h7cGL15EWCTh5p1w+EEX6GFX
   P3Njg0jLZFuKc0gw+M0CDlo3kDEr03p5rVJIJTir73Pxj8n94p0ltxH4o
   aSvLL+aQ3Xl2tYI+8lNwE3QnlI4XvzGwrDhv2lOWTPHj44tCK6ml0wLBJ
   pxb5JK31mlQJiHh0VUWANr4bFYQFIP9Y39nCqlYR+FYShtgoezThSI4HT
   mEjoznxqx/shvxSZyebA7gudRVq0/8YCmzbfE0TwRKo6OLX4CtqFJHtR5
   0zly6bPqyexo9SIwD7mlWo4SYIor7smEzbE4bjckZlO+9MQ0JHf9SOcK/
   Q==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Rob Herring <robh@kernel.org>, Hermes Zhang <Hermes.Zhang@axis.com>
CC:     "pavel@ucw.cz" <pavel@ucw.cz>, "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH v2 1/2] dt-binding: leds: Document leds-multi-gpio
 bindings
Thread-Topic: [PATCH v2 1/2] dt-binding: leds: Document leds-multi-gpio
 bindings
Thread-Index: AQHXIgDl2ysDeRaH6UilDJnuafb3DQ==
Date:   Mon, 29 Mar 2021 06:03:05 +0000
Message-ID: <f29fa789cef74d869db6728f90f28d50@XBOX01.axis.com>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-2-chenhui.zhang@axis.com>
 <20210327181222.GA327657@robh.at.kernel.org>
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

On 3/28/21 2:12 AM, Rob Herring wrote:=0A=
>> +=0A=
>> +  led-gpios:=0A=
>> +    description: Array of one or more GPIOs pins used to control the LE=
D.=0A=
>> +    minItems: 1=0A=
>> +    maxItems: 8  # Should be enough=0A=
>> +=0A=
>> +  led-states:=0A=
>> +    description: |=0A=
>> +      The array list the supported states here which will map to bright=
ness=0A=
>> +      from 0 to maximum. Each item in the array will present all the GP=
IOs=0A=
>> +      value by bit.=0A=
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array=0A=
>> +    minItems: 1=0A=
>> +    maxItems: 256 # Should be enough=0A=
> Isn't this the same as the standard 'brightness-levels' from backlight =
=0A=
> binding? The index is the level and the value is the h/w specific =0A=
> setting.=0A=
=0A=
Yes, it seems same.=0A=
=0A=
=0A=
Best Regards,=0A=
=0A=
Hermes=0A=
=0A=
