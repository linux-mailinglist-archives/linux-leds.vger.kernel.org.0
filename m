Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F30BC758CF
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 22:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfGYU04 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 16:26:56 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45538 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfGYU04 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 16:26:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PKQjR5041843;
        Thu, 25 Jul 2019 15:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564086405;
        bh=VLZxmiJMr9RdQawrPP+Vl8JPJpAFNYda1fRivNZ5irY=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=pNiWyGH7/DWQOrriNMmBwDV/Wkouh++ZsvAb4K9nyy5nhfYu1z8dvsFz/QyOVvddt
         Ac3xe10VrGtyLUT3wopfDtGxnkXVd7qllBgVLLB52CRZ6OBPqz3YWsd0hrg3gstVw4
         U9wcjdFlTI+u2f0gBr04fpHrErZttRuVn08ucygU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PKQjZb130699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jul 2019 15:26:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 15:26:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 15:26:45 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PKQjj7029658;
        Thu, 25 Jul 2019 15:26:45 -0500
Subject: Re: Abstraction for dual LED driver override feature
To:     Philip Molloy <philip@philipmolloy.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <-SZHSFMkCZILLVhmVPIa2HVHWpZN2OId3iixPCrsBNWCmtyC2bt5ATy3iOTlNuD_12k6xRBcXwUf7_WT3Ij7ccp0357LdxUUSjojm2_LFUc=@philipmolloy.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <37f829a6-c6ff-7a92-cb97-874b2d70b25f@ti.com>
Date:   Thu, 25 Jul 2019 15:26:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <-SZHSFMkCZILLVhmVPIa2HVHWpZN2OId3iixPCrsBNWCmtyC2bt5ATy3iOTlNuD_12k6xRBcXwUf7_WT3Ij7ccp0357LdxUUSjojm2_LFUc=@philipmolloy.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Phill

On 7/25/19 2:43 PM, Philip Molloy wrote:
> Hello,
>
> I'm writing a driver for the TI LM3644 dual current flash LED driver[1] and could use some advice on how to abstract a feature of the device that allows the user to fix the brightness of the 2nd LED to the brightness of the 1st.
>
> Bit 7 of the LED1 torch brightness register signifies whether the LED2 torch current should be set to the LED1 torch current. By default this override is enabled.
>
> Is it worth exposing this feature to userspace? And what might a good way to do that be?
>
> Or alternatively, hide the feature by setting bit 7 of the LED1 torch brightness register to 0 every time I write to the LED2 torch brightness register?
>
> Unfortunately, I couldn't find an example of similar functionality in any of the mainline LED kernel modules.

You could define this in the DT using the pre-defined led-sources property.

Unless this needs to be run time configurable which it does not appear

that it needs to be.  The default is combined LED brightness registers.

led-sources = < 0 1 >;

If led-sources does not exist in the DT then assume they are separate.

Example DT with combined LED outputs

led-controller@63 {
     compatible = "ti,lm3644";
     #address-cells = <1>;
     #size-cells = <0>;
     reg = <0x63>;

     led@0 {
         reg = <0>;

         led-sources = < 0 1 >;

         function = LED_FUNCTION_TORCH;
         color = <LED_COLOR_ID_WHITE>;
         led-max-microamp = <376000>;
         flash-max-microamp = <1500000>;
         flash-max-timeout-us = <1600000>;
     };
}

Example DT with separated LED outputs where output is the flash and 
output 2 is a torch

This would be two separate class registrations

led-controller@63 {
     compatible = "ti,lm3644";
     #address-cells = <1>;
     #size-cells = <0>;
     reg = <0x63>;

     led@0 {
         reg = <0>;

         function = LED_FUNCTION_FLASH;

         color = <LED_COLOR_ID_WHITE>;
         led-max-microamp = <376000>;
         flash-max-microamp = <1500000>;
         flash-max-timeout-us = <1600000>;
     };

     led@1 {
         reg = <1>;

         function = LED_FUNCTION_TORCH;

         color = <LED_COLOR_ID_WHITE>;
     };

}



Dan


>
> Best,
> Philip
>
> [1]: http://www.ti.com/lit/ds/symlink/lm3644.pdf
