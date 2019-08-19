Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3615294C9C
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 20:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfHSSW1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 14:22:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36824 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfHSSWZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 14:22:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so402482wme.1;
        Mon, 19 Aug 2019 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TPfTCZ9GaUJ+IPJNSnfAb2JtuTQWaYeI3jp3ZyPU2cI=;
        b=mqZLcXkkZYBm9vOGUt0LgKNTcpM53JYCoUrqrlZn8iZitUwFcfHuKXrYIQNP4+Thbq
         vzncbUIlU4ZunksMZUd41SAOAaXZorcdzn1JRdcB63X7dgTuOp5BZkaUSUx6DwDU6KRn
         y/WLOmGMI7xDT3l1OlnNgk6q95WaFxxEA5jik1/t2ibXSu3WpUj52aMKPh+Z2GJyU3u/
         RjB39+Z8IejAjNEaboGqrvkXgK8ywBcvojpvGQ+eMDSRc0Ziuakdp8So5yZexz8+WiRR
         SpzNkqxxbwjLoFzMdRWbl4MJWOWZWuadFw1WbeR42F1nyupwUNSkO1gS4ks/EfckoS+L
         r7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TPfTCZ9GaUJ+IPJNSnfAb2JtuTQWaYeI3jp3ZyPU2cI=;
        b=Wa/gc+ayFABicdyJplggfHsV/Lf0nTS3gDZC9y2BljHZnrp40hvW0KGHp50ctOMwwU
         nspiMWa8P+MMYEG+bY5BWiS7U53UXLUzXDMnN2AlaqNnKSlu+Nv1dKRcjqiy/jirguyd
         +xpdtW4bVLazQUkqlVknTXm9bQ08JoOCKchQ52sCvTCptgdfNtKs8QdWGC5YBpQjDqvj
         HoMyE9T1esTZR5Pwb3ZIYy1yIYKcWjlIZ9BH/SDqyz7qTWa2LlOux35onD/ZA3GXfDC5
         DJjfa9L0CQfe/e5csQQ0Jqeeg+SyR/WpK7AGyFUEbBMaHcr/rvODq1d9T+4qupXBAhUU
         grkQ==
X-Gm-Message-State: APjAAAUM3herGqtC8QRU0wqx3mKKDUYv4C+nW93tBYEiwoF6T6MsEQGs
        OVorbFTn7URKagDQq/iTUOA=
X-Google-Smtp-Source: APXvYqyeo/olqrygTwSg7ZSfAmlmnvyqmy4lYNi7K19RXXCA7phdHa4VVFeTiGKtEwXHT6WdYu+64A==
X-Received: by 2002:a1c:c188:: with SMTP id r130mr21001711wmf.73.1566238942687;
        Mon, 19 Aug 2019 11:22:22 -0700 (PDT)
Received: from [192.168.1.19] (cke222.neoplus.adsl.tpnet.pl. [83.31.80.222])
        by smtp.gmail.com with ESMTPSA id c201sm30533927wmd.33.2019.08.19.11.22.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 11:22:22 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd> <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
 <20190819143842.GA25401@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7c4c4853-7e3a-0618-92a0-337e248e2b4c@gmail.com>
Date:   Mon, 19 Aug 2019 20:22:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819143842.GA25401@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/19/19 4:38 PM, Pavel Machek wrote:
> On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
>> On 8/17/19 4:55 PM, Pavel Machek wrote:
>>> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
>>>> This allows LEDs to be controlled by block device activity.
>>>>
>>>> We already have ledtrig-disk (LED disk activity trigger), but the lower
>>>> level disk drivers need to utilize ledtrig_disk_activity() to make the
>>>> LED blink.
>>>>
>>>> The LED block device trigger doesn't require the lower level drivers to
>>>> have any instrumentation. The activity is collected by polling the disk
>>>> stats.
>>>>
>>>> Example:
>>>>
>>>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
>>>
>>> Lets use one trigger "block" and have the device as a parameter,
>>> please.
>>>
>>> We already have 1000 cpu triggers on 1000 cpu machines, and yes, its a
>>> disaster we'll need to fix. Lets not repeat the same mistake here.
>>>
>>> I guess it may be slightly more work. Sorry about that.
>>
>> We should be able to list available block devices to set,
>> so the problem would be not avoided anyway.
> 
> Should we? We need to list triggers, but we may not list all the devices...

This is similar to usbport trigger that lists available
ports as files in a sub-directory. We might eventually go
in this direction.

>> And Greg already proposed
>> a solution for trigger file PAGE_SIZE overflow, so this should not pose
>> a big problem in the future once that is implemented.
> 
> Which still leaves us with pretty big/ugly triggers file... and we do
> not have the fix in the tree yet.

Still, we have that interface and must keep it. It implies the fix
will need to be applied anyway.

-- 
Best regards,
Jacek Anaszewski
