Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A732919EC99
	for <lists+linux-leds@lfdr.de>; Sun,  5 Apr 2020 18:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgDEQ2f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Apr 2020 12:28:35 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41612 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgDEQ2f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Apr 2020 12:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=gt8zbf6Le1W6z7iSqHuQYNQ4IfCUTEic30B2rOlpQIY=; b=t7VXQjl2K1xCFJ97tKv1BzZ7vO
        JibHXA/D/TborFQgXoK3qMPj629MRWQ6X+LZiOFkccz1Bt5f10TvSLykDNlho58VBmdG17f/cS1PO
        yhbIR0RWzHUQzR/djiNoMN6OCa02K0nObJkjhm3rJZ8zebWSzKxOE7OwoxpE6FNPQPwGZFuz+iblT
        4tPuhU0j8rhpZI6bjT+bEXOqMSs7o0oC1m8pafnvJ4/4kAWYE+puZkrNr8x7s1XreZqCq7i0E5zNY
        JygciFZ4EmZyQamLi6RzAPQXCq/vnO6Da7ATWd8ChOgWmqFHvS7FjZLHr6GEKMUY/pXKwrchLZ08m
        qyaPz1xg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jL88P-0002k7-VL; Sun, 05 Apr 2020 16:28:34 +0000
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
 <619a1251-d062-b9bf-6752-b867fcaa600b@infradead.org>
 <34b07ce8-6a38-f45c-4624-730f5597f686@ti.com>
 <a6b93d69-a1d5-f515-ee37-6106b50120cf@gmail.com>
 <f09dadc9-f1ed-091b-f241-2f40b48f1117@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1cbe954e-76fb-9164-6b8c-af4ac70fcd05@infradead.org>
Date:   Sun, 5 Apr 2020 09:28:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f09dadc9-f1ed-091b-f241-2f40b48f1117@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/5/20 9:18 AM, Dan Murphy wrote:
> Jacek
> 
> On 4/5/20 10:08 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 4/3/20 4:39 PM, Dan Murphy wrote:
>>> Randy
>>>
>>> Thanks for the review
>>>
>>> On 4/2/20 10:47 PM, Randy Dunlap wrote:
>>>> Hi,
>>>> Here are a few changes for you to consider:
>>>>
>>>> On 4/2/20 1:42 PM, Dan Murphy wrote:
>>>>> Introduce a multicolor class that groups colored LEDs
>>>>> within a LED node.
>>>>>
>>>>> The multi color class groups monochrome LEDs and allows controlling two
>>>>        multicolor
>>> Ack
>>>>> aspects of the final combined color: hue and lightness. The former is
>>>>> controlled via <color>_intensity files and the latter is controlled
>>>>> via brightness file.
>>>>>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> ---
>>>>> diff --git a/Documentation/leds/leds-class-multicolor.rst
>>>>> b/Documentation/leds/leds-class-multicolor.rst
>>>>> new file mode 100644
>>>>> index 000000000000..5bb004999248
>>>>> --- /dev/null
>>>>> +++ b/Documentation/leds/leds-class-multicolor.rst
>>>>> @@ -0,0 +1,95 @@
>>>>> +====================================
>>>>> +Multi Color LED handling under Linux
>>>>     Multicolor
>>> Ack
>>>>> +====================================
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +The multi color class groups monochrome LEDs and allows controlling two
>>>>         multicolor
>>> Ack
>>>>> +aspects of the final combined color: hue and lightness. The former is
>>>>> +controlled via the color_intensity array file and the latter is
>>>>> controlled
>>>>> +via brightness file.
>>>>> +
>>>>> +For more details on hue and lightness notions please refer to
>>>>> +https://en.wikipedia.org/wiki/CIECAM02.
>>>>> +
>>>>> +Multicolor Class Control
>>>>> +========================
>>>>> +The multicolor class presents files that groups the colors as
>>>>> indexes in an
>>>>> +array.  These files are children under the LED parent node created
>>>>> by the
>>>>> +led_class framework.  The led_class framework is documented in
>>>>> led-class.rst
>>>>> +within this documentation directory.
>>>>> +
>>>>> +Each colored LED will be indexed under the color_* files. The order
>>>>> of the
>>>>> +colors are arbitrary the color_index file can be read to determine
>>>>> the color
>>>>> +to index value.
>>>>> +
>>>>> +The color_index file is an array that contains the string list of
>>>>> the colors as
>>>>> +they are defined in each color_* array file.
>>>>> +
>>>>> +The color_intensity is an array that can be read or written to for the
>>>>> +individual color intensities.  All elements within this array must
>>>>> be written in
>>>>> +order for the color LED intensities to be updated.
>>>>> +
>>>>> +The color_max_intensity is an array that can be read to indicate
>>>>> each color LED
>>>>> +maximum intensity value.
>>>>> +
>>>>> +The num_color_leds file returns the total number of color LEDs that are
>>>>> +presented in each color_* array.
>>>>> +
>>>>> +Directory Layout Example
>>>>> +========================
>>>>> +root:/sys/class/leds/multicolor:status# ls -lR
>>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16
>>>>> color_intensity
>>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
>>>>> +
>>>>> +Multicolor Class Brightness Control
>>>>> +===================================
>>>>> +The multiclor class framework will calculate each monochrome LEDs
>>>>> intensity.
>>>>         multicolor
>>> Ack
>>>>> +
>>>>> +The brightness level for each LED is calculated based on the color LED
>>>>> +intensity setting divided by the parent max_brightness setting
>>>>> multiplied by
>>>>> +the requested brightness.
>>>>> +
>>>>> +led_brightness = brightness * color_intensity/max_brightness
>>>>> +
>>>>> +Example:
>>>>> +A user first writes the color_intensity file with the brightness levels
>>>>> +that for each LED that is necessary to achieve a blueish violet
>>>>> output from a
>>>> drop first "that".
>>> Ack
>>>>                       that are
>>>> necessary                                   from an
>>> Ack and NACK the "from an".  It is from a since R is a consonant
>> But it sounds like a vowel and this rule for creating articles
>> "applies to the sound of the letter beginning the word, not just the
>> letter itself" [0].
>>
>> [0] https://www.grammar.com/a-vs-an-when-to-use/
>>
> We have had the same internal debate here at work.
> 
> How does "Red" when you say it sound like a vowel?  It is definitely a "R" sound that is first not a vowel sound.
> 
> To me "from an RGB" does not sound correct "from a RGB" is actually correct here because R or Red still leads with a consonant in both the sound and letter.
> 
> If it sounds as if it is beginning with a vowel sound, *use an*.  Like in "an honor" as the h is silent here.  R is not silent in Red or RGB.

It depends on how one reads "from a RGB." Do you say/think the letters R G B
(I do), or do you think/say red-green-blue?

From the [0] web page:
 Articles with Acronyms, a or an

Finally, the rule applies to acronyms as well. If you pronounce a letter as a letter and it begins with a vowel sound, you should precede it with an. The consonants with vowel sounds include f, h, l, m, n, r, s, and x.

    He flew in an SST. He fired an M‑1. He attended an FDA hearing.

By the same token, if a vowel letter, with a consonant sound, is pronounced as a letter, you should use a.

    He made a U‑turn.

Got it? So what is your grade?

    An A? A B? Surely not an F.


-- 
~Randy

