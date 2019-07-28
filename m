Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15D877FAE
	for <lists+linux-leds@lfdr.de>; Sun, 28 Jul 2019 15:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfG1NvT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Jul 2019 09:51:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32925 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfG1NvS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Jul 2019 09:51:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id c14so26414791plo.0;
        Sun, 28 Jul 2019 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J5EWyWb6OJG/qo28K8qrU5tbTM1GhiRTe7zmHtkL0sU=;
        b=N9evRnuLmAVuLHTqQAZ3uOBrXAThgh5gzpWjrFhIEwZMgblSRcil4F6BTvabT/JSCp
         0ll60vQnyXY4013QRHvhcNfQ4ViIB19pdRICB9rM0INQ71s53e5qR1n3TXdPJB/XpCxe
         oKiCxrV9+IoYmcRrjVrWTgW/u29NIy9L7mvb20VdR6jzjymiRgRpFr+IjLXWdfrSeN4t
         Uiry6wzxvRIn5BbhSnzX74/j91+N5ntITfgusBUWHcdd4X1HaOPyD7i7Q6lfv7B5qgbj
         VSwpgjyaLdcbbxf9U8J/M7aZPtrMBG6B0O6B8S/p5mnrTbA3nmZVSrPZpzn8qeLgk0s8
         Xb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J5EWyWb6OJG/qo28K8qrU5tbTM1GhiRTe7zmHtkL0sU=;
        b=nljlKU8v4hxDgdWAFc7VNh07Nv+87D+5fbfYyLxAUAycU6dCbLjGKaT7e8vfUk/GDo
         5kBJZxQcmjuYcMGdwl/wWTjz91CrXe9RzSFyITijPNphU4OpnsE9OhSHTQY6/WHzjmma
         waMOCQ3OTkRiCqH1K81w+zjrE5ycpFsxsua8AMlApBunxHuCxtWqyTFCudbH6ROea50b
         tk/LEUefgPzqcTWYEDHFAIZnMJRnS5xVB7Yd7OQRedXtmqZm8hPyGvApBi48kXyOMAyE
         d7gyQwurDNOAiwkBOblC+DVwH2T+OoVd84aO//DmQIJBAd+Bev90Ejag/xZgEchoiH4W
         yDAg==
X-Gm-Message-State: APjAAAWb1YVWmTcw9Tms4Fln6cgN3LSZ7YRhhqbAJYZEbmNDpGQKcxGw
        y8Q9mGSc6BS0WGIVT++wWLfiUuwNMye8FSKUXyo=
X-Google-Smtp-Source: APXvYqzql+I3rtHiPCzP+iWAhOvUZgDGGiWzkArham9wCsJ28xyhN0cqGq4Wqdx4n6uUVWM9QWfe+Hti42qY6lh88Kk=
X-Received: by 2002:a17:902:44f:: with SMTP id 73mr106702962ple.192.1564321878030;
 Sun, 28 Jul 2019 06:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
 <1563807552-23498-2-git-send-email-akinobu.mita@gmail.com> <44a6093f-7df7-9442-c33b-5827eb5f187b@gmail.com>
In-Reply-To: <44a6093f-7df7-9442-c33b-5827eb5f187b@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sun, 28 Jul 2019 22:51:06 +0900
Message-ID: <CAC5umygzNj=7LjzrzrVgOyLiZrKckaCgH68j0COFuWvX1yZAzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] block: introduce LED block device activity trigger
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B47=E6=9C=8827=E6=97=A5(=E5=9C=9F) 6:22 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> Thank you for the v2. I've checked and it works as expected.
>
> One thing is missing though - ABI documentation.
>
> Please add Documentation/ABI/testing/sysfs-class-led-trigger-blk
> and document read, write and discard files.

OK. I'll add document like below.

What:           /sys/class/leds/<led>/interval
Date:           Aug 2019
KernelVersion:  5.4
Contact:        linux-leds@vger.kernel.org
Description:
                Specifies the duration of the LED blink in milliseconds.
                Defaults to 50 ms.

What:           /sys/class/leds/<led>/read
Date:           Aug 2019
KernelVersion:  5.4
Contact:        linux-leds@vger.kernel.org
Description:
                Signal data read on the block device.
                If set to 0, the LED will not blink on data read.
                If set to 1 (default), the LED will blink for the milliseco=
nds
                specified in interval to signal data read.

What:           /sys/class/leds/<led>/write
Date:           Aug 2019
KernelVersion:  5.4
Contact:        linux-leds@vger.kernel.org
Description:
                Signal data written on the block device.
                If set to 0, the LED will not blink on data written.
                If set to 1 (default), the LED will blink for the milliseco=
nds
                specified in interval to signal data written.

What:           /sys/class/leds/<led>/discard
Date:           Aug 2019
KernelVersion:  5.4
Contact:        linux-leds@vger.kernel.org
Description:
                Signal data discarded on the block device.
                If set to 0, the LED will not blink on data discarded.
                If set to 1 (default), the LED will blink for the milliseco=
nds
                specified in interval to signal data discarded.
