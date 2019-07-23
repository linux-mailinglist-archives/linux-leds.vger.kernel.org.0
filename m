Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C8471B95
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2019 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfGWP2j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Jul 2019 11:28:39 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42595 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfGWP2j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Jul 2019 11:28:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so19313928pff.9;
        Tue, 23 Jul 2019 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gN2NTbMjgP0TcnnxiZaPLNnmbetdQsD4pX+fgmFtE3Q=;
        b=sILLQhYHkz0hsTzPPAOlsZq62m0+BakINShYPWdy8tukzrefq/YGrvPz3zMYRLuQ7i
         fehD9ajxRmArTBv1mZkHvycEy4QK3TfncqjROxYQOIIaZXYk/pXQiyG4mgo+Cwm1l/qu
         cUpQIP1+1JmkqTp/RWjr9S7abcvDPRgfizoctF4U8zPhxRpdmc/js7pgDYWLCWNIyawv
         8VEa6tQBMigmmTMD5Wlko6Rp5BNa3/05FqZWHSegaas5U39z9yTVaGxJMJns8hG+jtyV
         PsJl9q+JGW5N8zuIBIfozQ1DBEZil9L8R1damG5JTRMbihgVnUKoFbDwxijHFGumBMqs
         iRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gN2NTbMjgP0TcnnxiZaPLNnmbetdQsD4pX+fgmFtE3Q=;
        b=N5dUQwfuyM/Jrfsc1rkwZh1xTTv/Gw3fq3oXQGaWCm6WI1qi8FCGh/YyuOv5M9269h
         08P2OqraPObQ/J7cyHhLBRL2D/TFBGf/jApJb4bwc7CC8Ai62dHQsfQjp7fTppav5Vel
         EBlvOvF3ZpQKxc0QgoiqpAyDzGtl3XSPwWQuYXoZVFlickUQ5ulLszMwfGEkR27h7MvI
         Jf7B8zZ8UkWavgl8La6PPJY+4GEn5XOnj7DWGmBqKFprJqOP+NABS93QpEVqLefv6WRq
         ApDstF512+0BmAlLRHYcpT667j0IfLzqHGx2FPxv0nhvmoyQXU3lku8CPI6E+PlOp3CJ
         MvEg==
X-Gm-Message-State: APjAAAUJk19FAVmNW08CmBtMhygixCjMjPIzQcIdvxqfFlhpjujqbnNh
        5u0TkFm8LzYFSJajK2GxRCWiuZyC00EyDx4Owpg=
X-Google-Smtp-Source: APXvYqwr1+MClcxRpR3QHoRQhxy47KjKeLLybBqw5qgcnJE8csTvsL6em13Q1xnfHMHbwVL6v1kOD7JNmc6qUPoOElc=
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr48873905pjb.115.1563895719034;
 Tue, 23 Jul 2019 08:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <1563807552-23498-2-git-send-email-akinobu.mita@gmail.com> <201907231041.n2ZW7zai%lkp@intel.com>
In-Reply-To: <201907231041.n2ZW7zai%lkp@intel.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 24 Jul 2019 00:28:28 +0900
Message-ID: <CAC5umyi0O7iXW3x4vE2yTgjTkerKn+VQHJVOwdD7qPJnwJUyAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] block: introduce LED block device activity trigger
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
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

2019=E5=B9=B47=E6=9C=8823=E6=97=A5(=E7=81=AB) 11:22 kbuild test robot <lkp@=
intel.com>:
>
> Hi Akinobu,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc1 next-20190722]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Akinobu-Mita/block-intro=
duce-LED-block-device-activity-trigger/20190723-074956
> config: x86_64-rhel (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/scsi/mvsas/mv_94xx.c:11:0:
> >> drivers/scsi/mvsas/mv_94xx.h:278:2: error: redeclaration of enumerator=
 'LED_OFF'
>      LED_OFF =3D 0,
>      ^~~~~~~
>    In file included from include/linux/genhd.h:20:0,
>                     from include/linux/blkdev.h:11,
>                     from include/linux/blk-mq.h:5,
>                     from include/scsi/scsi_host.h:11,
>                     from include/linux/libata.h:21,
>                     from include/scsi/libsas.h:16,
>                     from drivers/scsi/mvsas/mv_sas.h:27,
>                     from drivers/scsi/mvsas/mv_94xx.c:10:
>    include/linux/leds.h:27:2: note: previous definition of 'LED_OFF' was =
here
>      LED_OFF  =3D 0,
>      ^~~~~~~
>    In file included from drivers/scsi/mvsas/mv_94xx.c:11:0:
> >> drivers/scsi/mvsas/mv_94xx.h:279:2: error: redeclaration of enumerator=
 'LED_ON'
>      LED_ON =3D 1,
>      ^~~~~~
>    In file included from include/linux/genhd.h:20:0,
>                     from include/linux/blkdev.h:11,
>                     from include/linux/blk-mq.h:5,
>                     from include/scsi/scsi_host.h:11,
>                     from include/linux/libata.h:21,
>                     from include/scsi/libsas.h:16,
>                     from drivers/scsi/mvsas/mv_sas.h:27,
>                     from drivers/scsi/mvsas/mv_94xx.c:10:
>    include/linux/leds.h:28:2: note: previous definition of 'LED_ON' was h=
ere
>      LED_ON  =3D 1,
>      ^~~~~~

The mvsas driver declares LED_* enums for enum sgpio_led_status.
I'm going to prepare a patch that adds 'SGPIO_' prefix to these enums.
