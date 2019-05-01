Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0596710E43
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 22:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfEAUvZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 16:51:25 -0400
Received: from mail.nic.cz ([217.31.204.67]:37248 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfEAUvZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 May 2019 16:51:25 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id D140062F89;
        Wed,  1 May 2019 22:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556743881; bh=DLPiL03anUFNoZTV1Y3Mk19kOrXoxHZw7khXICq28RI=;
        h=Date:From:To;
        b=Yw4541h61CyAfYeJy28IOYDx9hVXKnZynYcm81dxMAOKMsWWsdZtMkZp6fDYnxHkk
         lDtebvj4guYAudqr06gUvvM9u4INZTs7YMdH+0rAmk2qbsTf/7wK62Cngg4l7UvSYD
         0M9YdI4CrkUOdqV3XMMrO66ubBtS2wb348iRWF5w=
Date:   Wed, 1 May 2019 22:51:20 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     <linux-leds@vger.kernel.org>
Cc:     <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        <pavel@ucw.cz>
Subject: Multicolor Framework: brightness-model vs curve definition
Message-ID: <20190501225120.1ce3cfc6@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi guys,

I have been thinking about the last Multicolor Framework proposal by
Dan.

I think that the brightness-model solution to channel non-linearity and
non-uniformness is not optimal:
  1. user is only able to set color levels for colors defined in the
     models if they want linearity and uniformness. So if I have a RGB
     LED with brightness models for orange, yellow, magneta, and a few
     other colors, I can set only those colors reliably
  2. the device tree definition would be unnecessarily long if I want
     to define 100 levels for 6 colors... That's 600 lines of device
     tree code.

I therefore propose that instead of brightness-model nodes the device
tree should contain LED curve definition.

This way the interface can provide API by which the user is able to set
"arbitrary" color reliably (the interfaces provides uniformness between
channels and linearity in each channel) and the device tree does not have
to grow as fast as with the brightness-models.

I believe this would also address the problems Jacek was fearing.

The API could look something like this:
  The directory /sys/class/leds/<led>/colors should contain
      sync and sync_enable as proposed by Dan, and directory for each
      color
  The directory /sys/class/leds/<led>/colors/<color> shold contain
      enable_curve_transformation
          if this attribute == 1, the brightness and max_brightness
          attributes are transformed via the curve definition,
          otherwise they are raw values written/read from the controller
          This attribute is available only if the LED has a
          transformation curve defined.
      brightness
      max_brightness

A multi-color LED should be specified as in Dan's proposal, but without
the brightness model nodes/properties.
If a color channel node of a multi-color LED contains a led-curve
property (a phandle to a curve specifiaction), the curve transformation
should be available for this color channel.

A LED curve shall be defined as a device tree node with
led-curve-definition property.
This node can contain a string name property (is this needed? I don't
think so), and a array of points, each point a pair of integers.
The curve is defined by these points, it passes them and between each
two points it is linear (I don't believe bezier curves or something
else is needed).
A point <X Y> is interpreted as:
  X is the value written to brightness, it should be transformed to Y
  Y is the value written to HW
Example:
        curve-red {
                led-curve-definition;
                name = "red";
                points = <0 0>, <10 1>, <22 2>, <40 3>,
                         <60 6>, <90, 9>, <128 14>,
                         <192, 20>, ..., <255 255>;
        };

Example (some properties, like #address-cells are omitted):

led-controller@30 {
        compatible = "xyz";
        reg = <0x30>;

        curve_red: curve-red {
                led-curve-definition;
                name = "red";
                points = <0 0>, <10 1>, <22 2>, <40 3>,
                         <60 6>, <90, 9>, <128 14>,
                         <192, 20>, ..., <255 255>;
        };
        curve_green: curve-green {
                led-curve-definition;
                name = "green";
                points = <0 0>, <255 90>;
        };
        curve_blue: curve-blue {
                led-curve-definition;
                name = "blue";
                points = <0 0>, <255 90>;
        };

        multi-led@0 {
                reg = <0>;
                color = <LED_COLOR_ID_MULTI>;

                led@12 {
                        reg = <12>;
                        color = <LED_COLOR_ID_RED>;
                        led-curve = <&curve_red>;
                };

                led@13 {
                        reg = <13>;
                        color = <LED_COLOR_ID_GREEN>;
                        led-curve = <&curve_green>;
                };

                led@14 {
                        reg = <14>;
                        color = <LED_COLOR_ID_BLUE>;
                        led-curve = <&curve_blue>;
                };
        };
};

What do you think?

Marek
