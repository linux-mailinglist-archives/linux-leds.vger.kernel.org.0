Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D57C21034
	for <lists+linux-leds@lfdr.de>; Thu, 16 May 2019 23:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbfEPVm2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 May 2019 17:42:28 -0400
Received: from mail-oi1-f202.google.com ([209.85.167.202]:43336 "EHLO
        mail-oi1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfEPVm2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 May 2019 17:42:28 -0400
Received: by mail-oi1-f202.google.com with SMTP id l12so2045587oii.10
        for <linux-leds@vger.kernel.org>; Thu, 16 May 2019 14:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=bCifeYOTD3ZRMR+f0DJzC8Jsulb5gaAzagPHZLEhx8E=;
        b=eB3u/4N9Lqf1dpOkY9UM43yqpeZDopx8/soQCcOB2zamnS3shAPt6eJYcUjtwZ68aN
         54eUKlps4CZWJTRsXL5V2YpQgv3Ck8tGgZQ8VLWpucd6LkJHBsNaIqOw9gAdbwMA7old
         W0P0pDzR/Nmr+Ivj0q5UG/63CCRxK+iwccajCg4qF8mOs+Qvo8wrikc+rDwnPQ7PdNmY
         sspwXzouTux0Y/5Bg0xxiy5L0ebt8zvxEx4O9M7FKN1+sHpXbRg0I7d0+fRrjZAWGrc3
         DyXwJmdvqYDva/ZbQUHx1aTKWkgX+/wLP2keuESnXg8vHpK7Iswkjlpks48QPQoNjWg9
         9sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=bCifeYOTD3ZRMR+f0DJzC8Jsulb5gaAzagPHZLEhx8E=;
        b=NASBvYpVMavdMqOpNxH/IVhUvq0VMM+iw6DyG5UOkI5UPKi3Ri7Iz78H6dqnd0xGmL
         KsZ/s19/TsdqXMQQ/8a57Y9n+hUPKQ93DWKMsXp84Sq4EHPH9debMzgaL9zItoOJbBmZ
         nXRhZq2P2oe+roNioOVNjfdnwE56z30Ch+BAQBsrVc2zYUvpK7IcJV/6K4vZUsp/M5Sx
         IHpXnRHEIfZcFsNj2ExsRDG9+yVelcYyvyn4X3TkQcn1UXaGzvpEwgVmWRW6+oxdMnEu
         sBh6FuGgUHS+7qMWGN9yqr02X2cDzv5FMnaiNB3Qr1KFCSyV36Vwbg5Io1E0Syk5Lkbg
         vz9Q==
X-Gm-Message-State: APjAAAWjdXhFZYV4a8XTGA3P6AoDWW7CC5M1Ge2UPbmOyhmugR1l1Dyo
        /4wQSnhqzUVGlPgJAKwHIHdYfW41pYZf9jLQThT+hQnQEHfnf7OM2G7YwwrkoPGo3t1lCZWSKem
        cHtuHqIrcqA4neMAXTmdcVB/SszGtoXlPyYuQZnG3/y6ylrn0aeRdgHPAsHgYc1R5
X-Google-Smtp-Source: APXvYqymfc3zRs8o+jSc39kXwo0wB9flMCq+k1ZIVTCxqqf0oZhBmiZLWGcuX/yjgG0+8sd0WZgjf/2hhg==
X-Received: by 2002:a9d:7347:: with SMTP id l7mr511806otk.183.1558042947824;
 Thu, 16 May 2019 14:42:27 -0700 (PDT)
Date:   Thu, 16 May 2019 14:42:07 -0700
Message-Id: <20190516214209.139726-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH 0/2] Fix LED GPIO trigger behavior
From:   Kun Yi <kunyi@google.com>
To:     linux-leds@vger.kernel.org
Cc:     Kun Yi <kunyi@google.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, dmurphy@ti.com, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

*** BLURB HERE ***
Hello there,

I recently tested ledtrig-gpio on an embedded controller and one of the
issues I had involve not requesting the user input pin as GPIO.

In many embedded systems, a pin could be muxed as several functions, and
requesting the pin as GPIO is necessary to let pinmux select the pin as
a GPIO instead of, say an I2C pin. I'd like to learn whether it is appropriate
to assume user of ledtrig-gpio really intends to use GPIOs and not some
weird pins that are used as other functions.

Kun Yi (2):
  ledtrig-gpio: Request user input pin as GPIO
  ledtrig-gpio: 0 is a valid GPIO number

 drivers/leds/trigger/ledtrig-gpio.c | 35 ++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

